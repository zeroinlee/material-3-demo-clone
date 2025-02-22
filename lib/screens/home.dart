import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_3_demo_clone/config/adaptive/adaptive_scaffold.dart';

final actions = [
  Container(color: Colors.redAccent, width: 50, height: 50),
  const SizedBox(width: 10, height: 10),
  Container(color: Colors.blueAccent, width: 50, height: 50),
  const SizedBox(width: 10, height: 10),
  Container(color: Colors.yellowAccent, width: 50, height: 50),
  const SizedBox(width: 10, height: 10),
  Container(color: Colors.greenAccent, width: 50, height: 50),
];

class Home extends StatelessWidget {
  const Home({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      actions: [...actions],
      trailing: [...actions],
      trailingExtended: [Container(color: Colors.redAccent, height: 200)],
      body: navigationShell,
      currendIndex: navigationShell.currentIndex,
      onTap: (index) => navigationShell.goBranch(index),
      destinations: [
        BottomNavigationBarItem(
          icon: Container(color: Colors.red, width: 50, height: 50),
          label: 'Components',
        ),
        BottomNavigationBarItem(
          icon: Container(color: Colors.orange, width: 50, height: 50),
          label: 'Color',
        ),
        BottomNavigationBarItem(
          icon: Container(color: Colors.yellow, width: 50, height: 50),
          label: 'Typography',
        ),
        BottomNavigationBarItem(
          icon: Container(color: Colors.green, width: 50, height: 50),
          label: 'Elevation',
        ),
        // const BottomNavigationBarItem(
        //   tooltip: '',
        //   icon: Icon(Icons.widgets_outlined),
        //   label: 'Components',
        //   activeIcon: Icon(Icons.widgets),
        // ),
        // const BottomNavigationBarItem(
        //   tooltip: '',
        //   icon: Icon(Icons.format_paint_outlined),
        //   label: 'Color',
        //   activeIcon: Icon(Icons.format_paint),
        // ),
        // const BottomNavigationBarItem(
        //   tooltip: '',
        //   icon: Icon(Icons.text_snippet_outlined),
        //   label: 'Typography',
        //   activeIcon: Icon(Icons.text_snippet),
        // ),
        // const BottomNavigationBarItem(
        //   tooltip: '',
        //   icon: Icon(Icons.invert_colors_on_outlined),
        //   label: 'Elevation',
        //   activeIcon: Icon(Icons.opacity),
        // ),
      ],
    );
  }
}
