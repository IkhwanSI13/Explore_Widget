import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

/// Small toolbar that is intended to display near some selected
/// text and offer a few text formatting controls.
///
/// [EditorToolbar] expects to be displayed in a [Stack] where it
/// will position itself based on the given [anchor]. This can be
/// accomplished, for example, by adding [EditorToolbar] to the
/// application [Overlay]. Any other [Stack] should work, too.
class EditorToolbar extends StatefulWidget {
  const EditorToolbar({
    Key? key,
    required this.anchor,
    required this.editorFocusNode,
    required this.editor,
    required this.composer,
    required this.closeToolbar,
  }) : super(key: key);

  /// [EditorToolbar] displays itself horizontally centered and
  /// slightly above the given [anchor] value.
  ///
  /// [anchor] is a [ValueNotifier] so that [EditorToolbar] can
  /// reposition itself as the [Offset] value changes.
  final ValueNotifier<Offset?> anchor;

  /// The [FocusNode] attached to the editor to which this toolbar applies.
  final FocusNode editorFocusNode;

  /// The [editor] is used to alter document content, such as
  /// when the user selects a different block format for a
  /// text blob, e.g., paragraph, header, blockquote, or
  /// to apply styles to text.
  final DocumentEditor? editor;

  /// The [composer] provides access to the user's current
  /// selection within the document, which dictates the
  /// content that is altered by the toolbar's options.
  final DocumentComposer composer;

  /// Delegate that instructs the owner of this [EditorToolbar]
  /// to close the toolbar, such as after submitting a URL
  /// for some text.
  final VoidCallback closeToolbar;

  @override
  _EditorToolbarState createState() => _EditorToolbarState();
}

class _EditorToolbarState extends State<EditorToolbar> {
  bool _showUrlField = false;
  late FocusNode _urlFocusNode;
  AttributedTextEditingController? _urlController;

  @override
  void initState() {
    super.initState();
    _urlFocusNode = FocusNode();
    _urlController = SingleLineAttributedTextEditingController(_applyLink) //
      ..text = AttributedText(text: "https://");
  }

  @override
  void dispose() {
    _urlFocusNode.dispose();
    _urlController!.dispose();
    super.dispose();
  }

  /// Returns true if the currently selected text node is capable of being
  /// transformed into a different type text node, returns false if
  /// multiple nodes are selected, no node is selected, or the selected
  /// node is not a standard text block.
  bool _isConvertibleNode() {
    final selection = widget.composer.selection!;
    if (selection.base.nodeId != selection.extent.nodeId) {
      return false;
    }

    final selectedNode = widget.editor!.document.getNodeById(selection.extent.nodeId);
    return selectedNode is ParagraphNode || selectedNode is ListItemNode;
  }

  /// Returns the block type of the currently selected text node.
  ///
  /// Throws an exception if the currently selected node is not a text node.
  _TextType _getCurrentTextType() {
    final selectedNode = widget.editor!.document.getNodeById(widget.composer.selection!.extent.nodeId);
    if (selectedNode is ParagraphNode) {
      final type = selectedNode.getMetadataValue('blockType');

      if (type == header1Attribution) {
        return _TextType.header1;
      } else if (type == header2Attribution) {
        return _TextType.header2;
      } else if (type == header3Attribution) {
        return _TextType.header3;
      } else if (type == blockquoteAttribution) {
        return _TextType.blockquote;
      } else {
        return _TextType.paragraph;
      }
    } else if (selectedNode is ListItemNode) {
      return selectedNode.type == ListItemType.ordered ? _TextType.orderedListItem : _TextType.unorderedListItem;
    } else {
      throw Exception('Invalid node type: $selectedNode');
    }
  }

  /// Returns the text alignment of the currently selected text node.
  ///
  /// Throws an exception if the currently selected node is not a text node.
  TextAlign _getCurrentTextAlignment() {
    final selectedNode = widget.editor!.document.getNodeById(widget.composer.selection!.extent.nodeId);
    if (selectedNode is ParagraphNode) {
      final align = selectedNode.getMetadataValue('textAlign');
      switch (align) {
        case 'left':
          return TextAlign.left;
        case 'center':
          return TextAlign.center;
        case 'right':
          return TextAlign.right;
        case 'justify':
          return TextAlign.justify;
        default:
          return TextAlign.left;
      }
    } else {
      throw Exception('Alignment does not apply to node of type: $selectedNode');
    }
  }

  /// Returns true if a single text node is selected and that text node
  /// is capable of respecting alignment, returns false otherwise.
  bool _isTextAlignable() {
    final selection = widget.composer.selection!;
    if (selection.base.nodeId != selection.extent.nodeId) {
      return false;
    }

    final selectedNode = widget.editor!.document.getNodeById(selection.extent.nodeId);
    return selectedNode is ParagraphNode;
  }

  /// Converts the currently selected text node into a new type of
  /// text node, represented by [newType].
  ///
  /// For example: convert a paragraph to a blockquote, or a header
  /// to a list item.
  void _convertTextToNewType(_TextType? newType) {
    final existingTextType = _getCurrentTextType();

    if (existingTextType == newType) {
      // The text is already the desired type. Return.
      return;
    }

    if (_isListItem(existingTextType) && _isListItem(newType)) {
      widget.editor!.executeCommand(
        ChangeListItemTypeCommand(
          nodeId: widget.composer.selection!.extent.nodeId,
          newType: newType == _TextType.orderedListItem ? ListItemType.ordered : ListItemType.unordered,
        ),
      );
    } else if (_isListItem(existingTextType) && !_isListItem(newType)) {
      widget.editor!.executeCommand(
        ConvertListItemToParagraphCommand(
          nodeId: widget.composer.selection!.extent.nodeId,
          paragraphMetadata: {
            'blockType': _getBlockTypeAttribution(newType),
          },
        ),
      );
    } else if (!_isListItem(existingTextType) && _isListItem(newType)) {
      widget.editor!.executeCommand(
        ConvertParagraphToListItemCommand(
          nodeId: widget.composer.selection!.extent.nodeId,
          type: newType == _TextType.orderedListItem ? ListItemType.ordered : ListItemType.unordered,
        ),
      );
    } else {
      // Apply a new block type to an existing paragraph node.
      final existingNode =
          widget.editor!.document.getNodeById(widget.composer.selection!.extent.nodeId)! as ParagraphNode;
      existingNode.putMetadataValue('blockType', _getBlockTypeAttribution(newType));
    }
  }

  /// Returns true if the given [_TextType] represents an
  /// ordered or unordered list item, returns false otherwise.
  bool _isListItem(_TextType? type) {
    return type == _TextType.orderedListItem || type == _TextType.unorderedListItem;
  }

  /// Returns the text [Attribution] associated with the given
  /// [_TextType], e.g., [_TextType.header1] -> [header1Attribution].
  Attribution? _getBlockTypeAttribution(_TextType? newType) {
    switch (newType) {
      case _TextType.header1:
        return header1Attribution;
      case _TextType.header2:
        return header2Attribution;
      case _TextType.header3:
        return header3Attribution;
      case _TextType.blockquote:
        return blockquoteAttribution;
      case _TextType.paragraph:
      default:
        return null;
    }
  }

  /// Toggles bold styling for the current selected text.
  void _toggleBold() {
    widget.editor!.executeCommand(
      ToggleTextAttributionsCommand(
        documentSelection: widget.composer.selection!,
        attributions: {boldAttribution},
      ),
    );
  }

  /// Toggles italic styling for the current selected text.
  void _toggleItalics() {
    widget.editor!.executeCommand(
      ToggleTextAttributionsCommand(
        documentSelection: widget.composer.selection!,
        attributions: {italicsAttribution},
      ),
    );
  }

  /// Toggles strikethrough styling for the current selected text.
  void _toggleStrikethrough() {
    widget.editor!.executeCommand(
      ToggleTextAttributionsCommand(
        documentSelection: widget.composer.selection!,
        attributions: {strikethroughAttribution},
      ),
    );
  }

  /// Returns true if the current text selection includes part
  /// or all of a single link, returns false if zero links are
  /// in the selection or if 2+ links are in the selection.
  bool _isSingleLinkSelected() {
    return _getSelectedLinkSpans().length == 1;
  }

  /// Returns true if the current text selection includes 2+
  /// links, returns false otherwise.
  bool _areMultipleLinksSelected() {
    return _getSelectedLinkSpans().length >= 2;
  }

  /// Returns any link-based [AttributionSpan]s that appear partially
  /// or wholly within the current text selection.
  Set<AttributionSpan> _getSelectedLinkSpans() {
    final selection = widget.composer.selection!;
    final baseOffset = (selection.base.nodePosition as TextPosition).offset;
    final extentOffset = (selection.extent.nodePosition as TextPosition).offset;
    final selectionStart = min(baseOffset, extentOffset);
    final selectionEnd = max(baseOffset, extentOffset);
    final selectionRange = SpanRange(start: selectionStart, end: selectionEnd - 1);

    final textNode = widget.editor!.document.getNodeById(selection.extent.nodeId) as TextNode;
    final text = textNode.text;

    final overlappingLinkAttributions = text.getAttributionSpansInRange(
      attributionFilter: (Attribution attribution) => attribution is LinkAttribution,
      range: selectionRange,
    );

    return overlappingLinkAttributions;
  }

  /// Takes appropriate action when the toolbar's link button is
  /// pressed.
  void _onLinkPressed() {
    final selection = widget.composer.selection!;
    final baseOffset = (selection.base.nodePosition as TextPosition).offset;
    final extentOffset = (selection.extent.nodePosition as TextPosition).offset;
    final selectionStart = min(baseOffset, extentOffset);
    final selectionEnd = max(baseOffset, extentOffset);
    final selectionRange = SpanRange(start: selectionStart, end: selectionEnd - 1);

    final textNode = widget.editor!.document.getNodeById(selection.extent.nodeId) as TextNode;
    final text = textNode.text;

    final overlappingLinkAttributions = text.getAttributionSpansInRange(
      attributionFilter: (Attribution attribution) => attribution is LinkAttribution,
      range: selectionRange,
    );

    if (overlappingLinkAttributions.length >= 2) {
      // Do nothing when multiple links are selected.
      return;
    }

    if (overlappingLinkAttributions.isNotEmpty) {
      // The selected text contains one other link.
      final overlappingLinkSpan = overlappingLinkAttributions.first;
      final isLinkSelectionOnTrailingEdge =
          (overlappingLinkSpan.start >= selectionRange.start && overlappingLinkSpan.start <= selectionRange.end) ||
              (overlappingLinkSpan.end >= selectionRange.start && overlappingLinkSpan.end <= selectionRange.end);

      if (isLinkSelectionOnTrailingEdge) {
        // The selected text covers the beginning, or the end, or the entire
        // existing link. Remove the link attribution from the selected text.
        text.removeAttribution(overlappingLinkSpan.attribution, selectionRange);
      } else {
        // The selected text sits somewhere within the existing link. Remove
        // the entire link attribution.
        text.removeAttribution(
          overlappingLinkSpan.attribution,
          SpanRange(start: overlappingLinkSpan.start, end: overlappingLinkSpan.end),
        );
      }
    } else {
      // There are no other links in the selection. Show the URL text field.
      setState(() {
        _showUrlField = true;
        _urlFocusNode.requestFocus();
      });
    }
  }

  /// Takes the text from the [urlController] and applies it as a link
  /// attribution to the currently selected text.
  void _applyLink() {
    final url = _urlController!.text.text;

    final selection = widget.composer.selection!;
    final baseOffset = (selection.base.nodePosition as TextPosition).offset;
    final extentOffset = (selection.extent.nodePosition as TextPosition).offset;
    final selectionStart = min(baseOffset, extentOffset);
    final selectionEnd = max(baseOffset, extentOffset);
    final selectionRange = TextRange(start: selectionStart, end: selectionEnd - 1);

    final textNode = widget.editor!.document.getNodeById(selection.extent.nodeId) as TextNode;
    final text = textNode.text;

    final trimmedRange = _trimTextRangeWhitespace(text, selectionRange);

    final linkAttribution = LinkAttribution(url: Uri.parse(url));
    text.addAttribution(
      linkAttribution,
      trimmedRange,
    );

    // Clear the field and hide the URL bar
    _urlController!.clear();
    setState(() {
      _showUrlField = false;
      _urlFocusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
      widget.closeToolbar();
    });
  }

  /// Given [text] and a [range] within the [text], the [range] is
  /// shortened on both sides to remove any trailing whitespace and
  /// the new range is returned.
  SpanRange _trimTextRangeWhitespace(AttributedText text, TextRange range) {
    int startOffset = range.start;
    int endOffset = range.end;

    while (startOffset < range.end && text.text[startOffset] == ' ') {
      startOffset += 1;
    }
    while (endOffset > startOffset && text.text[endOffset] == ' ') {
      endOffset -= 1;
    }

    return SpanRange(start: startOffset, end: endOffset);
  }

  /// Changes the alignment of the current selected text node
  /// to reflect [newAlignment].
  void _changeAlignment(TextAlign? newAlignment) {
    if (newAlignment == null) {
      return;
    }
    String? newAlignmentValue;
    switch (newAlignment) {
      case TextAlign.left:
      case TextAlign.start:
        newAlignmentValue = 'left';
        break;
      case TextAlign.center:
        newAlignmentValue = 'center';
        break;
      case TextAlign.right:
      case TextAlign.end:
        newAlignmentValue = 'right';
        break;
      case TextAlign.justify:
        newAlignmentValue = 'justify';
        break;
    }

    final selectedNode = widget.editor!.document.getNodeById(widget.composer.selection!.extent.nodeId) as ParagraphNode;
    selectedNode.putMetadataValue('textAlign', newAlignmentValue);
  }

  /// Returns the localized name for the given [_TextType], e.g.,
  /// "Paragraph" or "Header 1".
  String _getTextTypeName(_TextType textType) {
    switch (textType) {
      case _TextType.header1:
        return "labelHeader1";
      case _TextType.header2:
        return "labelHeader2";
      case _TextType.header3:
        return "labelHeader3";
      case _TextType.paragraph:
        return "labelParagraph";
      case _TextType.blockquote:
        return "labelBlockquote";
      case _TextType.orderedListItem:
        return "labelBlockquote";
      case _TextType.unorderedListItem:
        return "labelUnorderedListItem";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conditionally display the URL text field below
        // the standard toolbar.
        if (_showUrlField)
          Positioned(
            left: widget.anchor.value!.dx,
            top: widget.anchor.value!.dy,
            child: FractionalTranslation(
              translation: const Offset(-0.5, 0.0),
              child: _buildUrlField(),
            ),
          ),
        _PositionedToolbar(
          anchor: widget.anchor,
          composer: widget.composer,
          child: ValueListenableBuilder<DocumentSelection?>(
            valueListenable: widget.composer.selectionNotifier,
            builder: (context, selection, child) {
              if (selection == null) {
                return const SizedBox();
              }
              if (selection.extent.nodePosition is! TextPosition) {
                // The user selected non-text content. This toolbar is probably
                // about to disappear. Until then, build nothing, because the
                // toolbar needs to inspect selected text to build correctly.
                return const SizedBox();
              }

              return _buildToolbar();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildToolbar() {
    var paddingBottom = MediaQuery.of(context).padding.bottom;
    return Material(
      shape: const StadiumBorder(),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.only(bottom: 244),
        child: SizedBox(
          height: 40 + paddingBottom,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Only allow the user to select a new type of text node if
              // the currently selected node can be converted.
              if (_isConvertibleNode()) ...[
                Tooltip(
                  message: "labelTextBlockType",
                  child: DropdownButton<_TextType>(
                    value: _getCurrentTextType(),
                    items: _TextType.values
                        .map((textType) => DropdownMenuItem<_TextType>(
                      value: textType,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(_getTextTypeName(textType)),
                      ),
                    ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    underline: const SizedBox(),
                    elevation: 0,
                    itemHeight: 48,
                    onChanged: _convertTextToNewType,
                  ),
                ),
                _buildVerticalDivider(),
              ],
              // Center(
              //   child: IconButton(
              //     onPressed: _toggleBold,
              //     icon: const Icon(Icons.format_bold),
              //     splashRadius: 16,
              //     tooltip: "labelBold",
              //   ),
              // ),
              Center(
                child: IconButton(
                  onPressed: _toggleItalics,
                  icon: const Icon(Icons.format_italic),
                  splashRadius: 16,
                  tooltip: "labelItalics",
                ),
              ),
              Center(
                child: IconButton(
                  onPressed: _toggleStrikethrough,
                  icon: const Icon(Icons.strikethrough_s),
                  splashRadius: 16,
                  tooltip: "labelStrikethrough",
                ),
              ),
              Center(
                child: IconButton(
                  onPressed: _areMultipleLinksSelected() ? null : _onLinkPressed,
                  icon: const Icon(Icons.link),
                  color: _isSingleLinkSelected() ? const Color(0xFF007AFF) : IconTheme.of(context).color,
                  splashRadius: 16,
                  tooltip: "labelLink",
                ),
              ),
              // Only display alignment controls if the currently selected text
              // node respects alignment. List items, for example, do not.
              if (_isTextAlignable()) ...[
                _buildVerticalDivider(),
                Tooltip(
                  message: "labelTextAlignment",
                  child: DropdownButton<TextAlign>(
                    value: _getCurrentTextAlignment(),
                    items: [TextAlign.left, TextAlign.center, TextAlign.right, TextAlign.justify]
                        .map((textAlign) => DropdownMenuItem<TextAlign>(
                      value: textAlign,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(_buildTextAlignIcon(textAlign)),
                      ),
                    ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    underline: const SizedBox(),
                    elevation: 0,
                    itemHeight: 48,
                    onChanged: _changeAlignment,
                  ),
                ),
              ],
              _buildVerticalDivider(),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  splashRadius: 16,
                  tooltip: "labelMoreOptions",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUrlField() {
    return Material(
      shape: const StadiumBorder(),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 400,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: FocusWithCustomParent(
                focusNode: _urlFocusNode,
                parentFocusNode: widget.editorFocusNode,
                // We use a SuperTextField instead of a TextField because TextField
                // automatically re-parents its FocusNode, which causes #609. Flutter
                // #106923 tracks the TextField issue.
                child: SuperTextField(
                  focusNode: _urlFocusNode,
                  textController: _urlController,
                  minLines: 1,
                  maxLines: 1,
                  // inputSource: TextInputSource.ime,
                  hintBehavior: HintBehavior.displayHintUntilTextEntered,
                  hintBuilder: (context) {
                    return Text(
                      "enter a url...",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    );
                  },
                  textStyleBuilder: (_) {
                    return const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    );
                  },
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              iconSize: 20,
              splashRadius: 16,
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _urlFocusNode.unfocus();
                  _showUrlField = false;
                  _urlController!.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      color: Colors.grey.shade300,
    );
  }

  IconData _buildTextAlignIcon(TextAlign align) {
    switch (align) {
      case TextAlign.left:
      case TextAlign.start:
        return Icons.format_align_left;
      case TextAlign.center:
        return Icons.format_align_center;
      case TextAlign.right:
      case TextAlign.end:
        return Icons.format_align_right;
      case TextAlign.justify:
        return Icons.format_align_justify;
    }
  }
}

enum _TextType {
  header1,
  header2,
  header3,
  paragraph,
  blockquote,
  orderedListItem,
  unorderedListItem,
}

/// Small toolbar that is intended to display over an image and
/// offer controls to expand or contract the size of the image.
///
/// [ImageFormatToolbar] expects to be displayed in a [Stack] where it
/// will position itself based on the given [anchor]. This can be
/// accomplished, for example, by adding [ImageFormatToolbar] to the
/// application [Overlay]. Any other [Stack] should work, too.
class ImageFormatToolbar extends StatefulWidget {
  const ImageFormatToolbar({
    Key? key,
    required this.anchor,
    required this.composer,
    required this.setWidth,
    required this.closeToolbar,
  }) : super(key: key);

  /// [ImageFormatToolbar] displays itself horizontally centered and
  /// slightly above the given [anchor] value.
  ///
  /// [anchor] is a [ValueNotifier] so that [ImageFormatToolbar] can
  /// reposition itself as the [Offset] value changes.
  final ValueNotifier<Offset?> anchor;

  /// The [composer] provides access to the user's current
  /// selection within the document, which dictates the
  /// content that is altered by the toolbar's options.
  final DocumentComposer composer;

  /// Callback that should update the width of the component with
  /// the given [nodeId] to match the given [width].
  final void Function(String nodeId, double? width) setWidth;

  /// Delegate that instructs the owner of this [ImageFormatToolbar]
  /// to close the toolbar.
  final VoidCallback closeToolbar;

  @override
  _ImageFormatToolbarState createState() => _ImageFormatToolbarState();
}

class _ImageFormatToolbarState extends State<ImageFormatToolbar> {
  void _makeImageConfined() {
    widget.setWidth(widget.composer.selection!.extent.nodeId, null);
  }

  void _makeImageFullBleed() {
    widget.setWidth(widget.composer.selection!.extent.nodeId, double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    return _PositionedToolbar(
      anchor: widget.anchor,
      composer: widget.composer,
      child: ValueListenableBuilder<DocumentSelection?>(
        valueListenable: widget.composer.selectionNotifier,
        builder: (context, selection, child) {
          if (selection == null) {
            return const SizedBox();
          }
          if (selection.extent.nodePosition is! UpstreamDownstreamNodePosition) {
            // The user selected non-image content. This toolbar is probably
            // about to disappear. Until then, build nothing, because the
            // toolbar needs to inspect selected image to build correctly.
            return const SizedBox();
          }

          return _buildToolbar();
        },
      ),
    );
  }

  Widget _buildToolbar() {
    return Material(
      shape: const StadiumBorder(),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: IconButton(
                  onPressed: _makeImageConfined,
                  icon: const Icon(Icons.photo_size_select_large),
                  splashRadius: 16,
                  tooltip: "labelBold",
                ),
              ),
              Center(
                child: IconButton(
                  onPressed: _makeImageFullBleed,
                  icon: const Icon(Icons.photo_size_select_actual),
                  splashRadius: 16,
                  tooltip: "labelItalics",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PositionedToolbar extends StatelessWidget {
  const _PositionedToolbar({
    Key? key,
    required this.anchor,
    required this.composer,
    required this.child,
  }) : super(key: key);

  final ValueNotifier<Offset?> anchor;
  final DocumentComposer composer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Offset?>(
      valueListenable: anchor,
      builder: (context, offset, _) {
        if (offset == null || composer.selection == null) {
          // When no anchor position is available, or the user hasn't
          // selected any text, show nothing.
          return const SizedBox();
        }

        return SizedBox.expand(
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy,
                child: FractionalTranslation(
                  translation: const Offset(-0.5, -1.4),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SingleLineAttributedTextEditingController extends AttributedTextEditingController {
  SingleLineAttributedTextEditingController(this.onSubmit);

  final VoidCallback onSubmit;

  @override
  void insertNewline() {
    // Don't insert newline in a single-line text field.

    // Invoke callback to take action on enter.
    onSubmit();

    // TODO: this is a hack. SuperTextField shouldn't insert newlines in a single
    // line field (#697).
  }
}
