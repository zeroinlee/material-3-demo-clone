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
    );
  }
}
