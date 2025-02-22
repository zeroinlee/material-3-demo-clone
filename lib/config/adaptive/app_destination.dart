import 'package:flutter/material.dart';

abstract final class AppDestination {
  static const componentIcon = Icon(Icons.widgets_outlined);
  static const componentSelectedIcon = Icon(Icons.widgets);
  static const componentLabel = 'Components';

  static const colorIcon = Icon(Icons.format_paint_outlined);
  static const colorSelectedIcon = Icon(Icons.format_paint);
  static const colorLabel = 'Color';

  static const typographyIcon = Icon(Icons.text_snippet_outlined);
  static const typographySelectedIcon = Icon(Icons.text_snippet);
  static const typographyLabel = 'Typography';

  static const elevationIcon = Icon(Icons.invert_colors_on_outlined);
  static const elevationSelectedIcon = Icon(Icons.opacity);
  static const elevationLabel = 'Elevation';

  static const List<NavigationRailDestination> destinations = [
    NavigationRailDestination(
      icon: componentIcon,
      selectedIcon: componentSelectedIcon,
      label: Text(componentLabel, maxLines: 1),
    ),
    NavigationRailDestination(
      icon: colorIcon,
      selectedIcon: colorSelectedIcon,
      label: Text(colorLabel, maxLines: 1),
    ),
    NavigationRailDestination(
      icon: typographyIcon,
      selectedIcon: typographySelectedIcon,
      label: Text(typographyLabel, maxLines: 1),
    ),
    NavigationRailDestination(
      icon: elevationIcon,
      selectedIcon: elevationSelectedIcon,
      label: Text(elevationLabel, maxLines: 1),
    ),
  ];

  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: componentIcon,
      activeIcon: componentSelectedIcon,
      label: componentLabel,
    ),
    BottomNavigationBarItem(
      icon: colorIcon,
      activeIcon: colorSelectedIcon,
      label: colorLabel,
    ),
    BottomNavigationBarItem(
      icon: typographyIcon,
      activeIcon: typographySelectedIcon,
      label: typographyLabel,
    ),
    BottomNavigationBarItem(
      icon: elevationIcon,
      activeIcon: elevationSelectedIcon,
      label: elevationLabel,
    ),
  ];
}
