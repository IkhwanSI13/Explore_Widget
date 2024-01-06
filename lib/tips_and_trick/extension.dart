import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ///
  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;
}

extension MaterialStateHelpers on Iterable<MaterialState> {
  bool get isHovered => contains(MaterialState.hovered);

  bool get isFocused => contains(MaterialState.focused);

  bool get isPressed => contains(MaterialState.pressed);

  bool get isDragged => contains(MaterialState.dragged);

  bool get isSelected => contains(MaterialState.selected);

  bool get isScrolledUnder => contains(MaterialState.scrolledUnder);

  bool get isDisabled => contains(MaterialState.disabled);

  bool get isError => contains(MaterialState.error);
}

extension IterableExtensions on Iterable {
  bool containsAny(Iterable<Object?> other) => other.any((e) => contains(e));
}
