import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

import '_example_document.dart';
import '_toolbar.dart';

class SuperEditorActivity extends StatefulWidget {
  const SuperEditorActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<SuperEditorActivity> createState() => _SuperEditorActivityState();
}

class _SuperEditorActivityState extends State<SuperEditorActivity> {
  final GlobalKey _docLayoutKey = GlobalKey();

  late Document _doc;
  late DocumentEditor _docEditor;
  late DocumentComposer _composer;
  late CommonEditorOperations _docOps;

  late FocusNode _editorFocusNode;

  late ScrollController _scrollController;

  final _darkBackground = const Color(0xFF222222);
  final _lightBackground = Colors.white;
  Brightness _brightness = Brightness.light;

  OverlayEntry? _textFormatBarOverlayEntry;
  final _textSelectionAnchor = ValueNotifier<Offset?>(null);

  OverlayEntry? _imageFormatBarOverlayEntry;
  final _imageSelectionAnchor = ValueNotifier<Offset?>(null);

  // final _overlayController = MagnifierAndToolbarController();

  @override
  void initState() {
    super.initState();
    _doc = createInitialDocument()..addListener(_hideOrShowToolbar);
    _docEditor = DocumentEditor(document: _doc as MutableDocument);
    _composer = DocumentComposer();
    _composer.selectionNotifier.addListener(_hideOrShowToolbar);
    _docOps = CommonEditorOperations(
      editor: _docEditor,
      composer: _composer,
      documentLayoutResolver: () => _docLayoutKey.currentState as DocumentLayout,
    );
    _editorFocusNode = FocusNode();
    _scrollController = ScrollController()..addListener(_hideOrShowToolbar);
  }

  @override
  void dispose() {
    if (_textFormatBarOverlayEntry != null) {
      _textFormatBarOverlayEntry!.remove();
    }

    _scrollController.dispose();
    _editorFocusNode.dispose();
    _composer.dispose();
    super.dispose();
  }

  void _hideOrShowToolbar() {
    if (_gestureMode != DocumentGestureMode.mouse) {
      // We only add our own toolbar when using mouse. On mobile, a bar
      // is rendered for us.
      return;
    }

    final selection = _composer.selection;
    if (selection == null) {
      // Nothing is selected. We don't want to show a toolbar
      // in this case.
      _hideEditorToolbar();

      return;
    }
    if (selection.base.nodeId != selection.extent.nodeId) {
      // More than one node is selected. We don't want to show
      // a toolbar in this case.
      _hideEditorToolbar();
      _hideImageToolbar();

      return;
    }
    if (selection.isCollapsed) {
      // We only want to show the toolbar when a span of text
      // is selected. Therefore, we ignore collapsed selections.
      _hideEditorToolbar();
      _hideImageToolbar();

      return;
    }

    final selectedNode = _doc.getNodeById(selection.extent.nodeId);

    if (selectedNode is ImageNode) {
      // Show the editor's toolbar for image sizing.
      _showImageToolbar();
      _hideEditorToolbar();
      return;
    } else {
      // The currently selected content is not an image. We don't
      // want to show the image toolbar.
      _hideImageToolbar();
    }

    if (selectedNode is TextNode) {
      // Show the editor's toolbar for text styling.
      _showEditorToolbar();
      _hideImageToolbar();
      return;
    } else {
      // The currently selected content is not a paragraph. We don't
      // want to show a toolbar in this case.
      _hideEditorToolbar();
    }
  }

  void _showEditorToolbar() {
    if (_textFormatBarOverlayEntry == null) {
      // Create an overlay entry to build the editor toolbar.
      // TODO: add an overlay to the Editor widget to avoid using the
      //       application overlay
      _textFormatBarOverlayEntry ??= OverlayEntry(builder: (context) {
        return Container(child: Text("asd"),);
        return EditorToolbar(
          anchor: _textSelectionAnchor,
          editorFocusNode: _editorFocusNode,
          editor: _docEditor,
          composer: _composer,
          closeToolbar: _hideEditorToolbar,
        );
      });

      // Display the toolbar in the application overlay.
      final overlay = Overlay.of(context);
      overlay.insert(_textFormatBarOverlayEntry!);
    }

    // Schedule a callback after this frame to locate the selection
    // bounds on the screen and display the toolbar near the selected
    // text.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_textFormatBarOverlayEntry == null) {
        return;
      }

      final docBoundingBox = (_docLayoutKey.currentState as DocumentLayout)
          .getRectForSelection(_composer.selection!.base, _composer.selection!.extent)!;
      final docBox = _docLayoutKey.currentContext!.findRenderObject() as RenderBox;
      final overlayBoundingBox = Rect.fromPoints(
        docBox.localToGlobal(docBoundingBox.topLeft),
        docBox.localToGlobal(docBoundingBox.bottomRight),
      );

      _textSelectionAnchor.value = overlayBoundingBox.topCenter;
    });
  }

  void _hideEditorToolbar() {
    // Null out the selection anchor so that when it re-appears,
    // the bar doesn't momentarily "flash" at its old anchor position.
    _textSelectionAnchor.value = null;

    if (_textFormatBarOverlayEntry != null) {
      // Remove the toolbar overlay and null-out the entry.
      // We null out the entry because we can't query whether
      // or not the entry exists in the overlay, so in our
      // case, null implies the entry is not in the overlay,
      // and non-null implies the entry is in the overlay.
      _textFormatBarOverlayEntry!.remove();
      _textFormatBarOverlayEntry = null;

      // Ensure that focus returns to the editor.
      //
      // I tried explicitly unfocus()'ing the URL textfield
      // in the toolbar but it didn't return focus to the
      // editor. I'm not sure why.
      _editorFocusNode.requestFocus();
    }
  }

  DocumentGestureMode get _gestureMode {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return DocumentGestureMode.android;
      case TargetPlatform.iOS:
        return DocumentGestureMode.iOS;
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return DocumentGestureMode.mouse;
    }
  }

  bool get _isMobile => _gestureMode != DocumentGestureMode.mouse;

  // TextInputSource get _inputSource {
  //   switch (defaultTargetPlatform) {
  //     case TargetPlatform.android:
  //     case TargetPlatform.iOS:
  //     case TargetPlatform.fuchsia:
  //     case TargetPlatform.linux:
  //     case TargetPlatform.macOS:
  //     case TargetPlatform.windows:
  //       return TextInputSource.ime;
  //   // return DocumentInputSource.keyboard;
  //   }
  // }

  void _cut() {
    _docOps.cut();
    // _overlayController.hideToolbar();
  }

  void _copy() {
    _docOps.copy();
    // _overlayController.hideToolbar();
  }

  void _paste() {
    _docOps.paste();
    // _overlayController.hideToolbar();
  }

  void _selectAll() => _docOps.selectAll();

  void _showImageToolbar() {
    if (_imageFormatBarOverlayEntry == null) {
      // Create an overlay entry to build the image toolbar.
      _imageFormatBarOverlayEntry ??= OverlayEntry(builder: (context) {
        return Container();
        return ImageFormatToolbar(
          anchor: _imageSelectionAnchor,
          composer: _composer,
          setWidth: (nodeId, width) {
            final node = _doc.getNodeById(nodeId)!;
            final currentStyles = SingleColumnLayoutComponentStyles.fromMetadata(node);
            SingleColumnLayoutComponentStyles(
              width: width,
              padding: currentStyles.padding,
            ).applyTo(node);
          },
          closeToolbar: _hideImageToolbar,
        );
      });

      // Display the toolbar in the application overlay.
      final overlay = Overlay.of(context);
      overlay.insert(_imageFormatBarOverlayEntry!);
    }

    // Schedule a callback after this frame to locate the selection
    // bounds on the screen and display the toolbar near the selected
    // text.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_imageFormatBarOverlayEntry == null) {
        return;
      }

      final docBoundingBox = (_docLayoutKey.currentState as DocumentLayout)
          .getRectForSelection(_composer.selection!.base, _composer.selection!.extent)!;
      final docBox = _docLayoutKey.currentContext!.findRenderObject() as RenderBox;
      final overlayBoundingBox = Rect.fromPoints(
        docBox.localToGlobal(docBoundingBox.topLeft),
        docBox.localToGlobal(docBoundingBox.bottomRight),
      );

      _imageSelectionAnchor.value = overlayBoundingBox.center;
    });
  }

  void _hideImageToolbar() {
    // Null out the selection anchor so that when the bar re-appears,
    // it doesn't momentarily "flash" at its old anchor position.
    _imageSelectionAnchor.value = null;

    if (_imageFormatBarOverlayEntry != null) {
      // Remove the image toolbar overlay and null-out the entry.
      // We null out the entry because we can't query whether
      // or not the entry exists in the overlay, so in our
      // case, null implies the entry is not in the overlay,
      // and non-null implies the entry is in the overlay.
      _imageFormatBarOverlayEntry!.remove();
      _imageFormatBarOverlayEntry = null;

      // Ensure that focus returns to the editor.
      _editorFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("super_editor"),
      ),
      body: Theme(
        data: ThemeData(brightness: _brightness),
        child: Builder(builder: (themedContext) {
          // This builder captures the new theme
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildEditor(themedContext),
                    ),
                  ),
                  if (_isMobile) _buildMountedToolbar(),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildEditor(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return ColoredBox(
      color: isLight ? _lightBackground : _darkBackground,
      child: SuperEditor(
        editor: _docEditor,
        composer: _composer,
        focusNode: _editorFocusNode,
        scrollController: _scrollController,
        documentLayoutKey: _docLayoutKey,
        documentOverlayBuilders: [
          DefaultCaretOverlayBuilder(
            CaretStyle().copyWith(color: isLight ? Colors.black : Colors.redAccent),
          ),
        ],
        selectionStyle: isLight
            ? defaultSelectionStyle
            : SelectionStyles(
          selectionColor: Colors.red.withOpacity(0.3),
        ),
        stylesheet: defaultStylesheet.copyWith(
          addRulesAfter: [
            if (!isLight) ..._darkModeStyles,
            // taskStyles,
          ],
        ),
        componentBuilders: [
          // TaskComponentBuilder(_docEditor),
          ...defaultComponentBuilders,
        ],
        gestureMode: _gestureMode,
        // inputSource: _inputSource,
        // keyboardActions: _inputSource == TextInputSource.ime ? defaultImeKeyboardActions : defaultKeyboardActions,
        androidToolbarBuilder: (_) => AndroidTextEditingFloatingToolbar(
          onCutPressed: _cut,
          onCopyPressed: _copy,
          onPastePressed: _paste,
          onSelectAllPressed: _selectAll,
        ),
        iOSToolbarBuilder: (_) => IOSTextEditingFloatingToolbar(
          onCutPressed: _cut,
          onCopyPressed: _copy,
          onPastePressed: _paste,
        ),
        // overlayController: _overlayController,
      ),
    );
  }

  /// MyNote: Show bottom action like bold, italic and more
  Widget _buildMountedToolbar() {
    return MultiListenableBuilder(
      listenables: <Listenable>{
        _doc,
        _composer.selectionNotifier,
      },
      builder: (_) {
        final selection = _composer.selection;

        if (selection == null) {
          return const SizedBox();
        }

        return KeyboardEditingToolbar(
          document: _doc,
          composer: _composer,
          commonOps: _docOps,
        );
      },
    );
  }
}

// Makes text light, for use during dark mode styling.
final _darkModeStyles = [
  StyleRule(
    BlockSelector.all,
        (doc, docNode) {
      return {
        "textStyle": const TextStyle(
          color: Color(0xFFCCCCCC),
        ),
      };
    },
  ),
  StyleRule(
    const BlockSelector("header1"),
        (doc, docNode) {
      return {
        "textStyle": const TextStyle(
          color: Color(0xFF888888),
        ),
      };
    },
  ),
  StyleRule(
    const BlockSelector("header2"),
        (doc, docNode) {
      return {
        "textStyle": const TextStyle(
          color: Color(0xFF888888),
        ),
      };
    },
  ),
];
