import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:material_3_demo_clone/config/adaptive/app_destination.dart';
import 'package:material_3_demo_clone/config/adaptive/app_breakpoint.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    this.appBar,
    this.navigationBar,
    this.navigationRail,
    required this.body,
    this.actions,
    required this.trailing,
    required this.trailingExtended,
    required this.currendIndex,
    required this.onTap,
  });

  final Widget? appBar;
  final Widget? navigationBar;
  final Widget? navigationRail;
  final Widget body;

  final List<Widget>? actions;
  final List<Widget> trailing;
  final List<Widget> trailingExtended;

  final int currendIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        internalAnimations: false,
        transitionDuration: Duration.zero,

        // AppBar
        topNavigation: SlotLayout(
          config: {
            const Breakpoint(
              beginWidth: 0,
              endWidth: AppBreakpoint.medium,
            ): SlotLayout.from(
              key: const Key('AppBar small'),
              builder: (context) {
                return _AdaptiveAppBar(actions: actions);
              },
            ),
            const Breakpoint(
              beginWidth: AppBreakpoint.medium,
              endWidth: null,
            ): SlotLayout.from(
              key: const Key('AppBar mediumAndLarge'),
              builder: (context) {
                return const _AdaptiveAppBar();
              },
            ),
          },
        ),

        // NavigationRail
        primaryNavigation: SlotLayout(
          config: {
            const Breakpoint(
              beginWidth: AppBreakpoint.medium,
              endWidth: AppBreakpoint.large,
            ): SlotLayout.from(
              key: const Key('NavigationRail medium'),
              builder: (context) {
                return _AdaptiveNavigationRail(
                  extended: false,
                  selectedIndex: currendIndex,
                  onDestinationSelected: onTap,
                  destinations: AppDestination.destinations,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: trailing,
                  ),
                );
              },
            ),
            const Breakpoint(
              beginWidth: AppBreakpoint.large,
              endWidth: null,
            ): SlotLayout.from(
              key: const Key('NavigationRail medium'),
              builder: (context) {
                return _AdaptiveNavigationRail(
                  extended: true,
                  selectedIndex: currendIndex,
                  onDestinationSelected: onTap,
                  destinations: AppDestination.destinations,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: trailingExtended,
                  ),
                );
              },
            ),
          },
        ),

        // body
        body: SlotLayout(
          config: {
            const Breakpoint(beginWidth: 0, endWidth: null): SlotLayout.from(
              key: const Key('body all'),
              builder: (context) {
                return body;
              },
            ),
          },
        ),
      ),

      // bottomNavagationBar
      bottomNavigationBar: SlotLayout(
        config: {
          const Breakpoint(
            beginWidth: 0,
            endWidth: AppBreakpoint.medium,
          ): SlotLayout.from(
            key: const Key('NavigationBar small'),
            builder: (context) {
              return _AdaptiveBottomNavigationBar(
                currendIndex: currendIndex,
                onTap: onTap,
                items: AppDestination.items,
              );
            },
          ),
        },
      ),
    );
  }
}

class _AdaptiveBottomNavigationBar extends StatelessWidget {
  const _AdaptiveBottomNavigationBar({
    required this.currendIndex,
    required this.onTap,
    required this.items,
  });

  final int currendIndex;
  final Function(int index) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.purpleAccent,
      type: BottomNavigationBarType.fixed,
      currentIndex: currendIndex,
      onTap: onTap,
      items: items,
    );
  }
}

class _AdaptiveNavigationRail extends StatelessWidget {
  const _AdaptiveNavigationRail({
    required this.trailing,
    required this.extended,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final Widget trailing;
  final bool extended;
  final int selectedIndex;
  final Function(int index) onDestinationSelected;
  final List<NavigationRailDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: NavigationRail(
        backgroundColor: Colors.amber,
        extended: extended,

        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,

        trailing: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: trailing,
          ),
        ),
      ),
    );
  }
}

class _AdaptiveAppBar extends StatelessWidget {
  const _AdaptiveAppBar({this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AppBar(backgroundColor: Colors.purpleAccent, actions: actions),
    );
  }
}
