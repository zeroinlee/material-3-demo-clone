import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:material_3_demo_clone/config/adaptive/app_breakpoint.dart';

class AdaptiveBody extends StatelessWidget {
  const AdaptiveBody({
    super.key,
    required this.body,
    required this.secondaryBody,
  });

  final Widget body;
  final Widget secondaryBody;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      internalAnimations: false,
      transitionDuration: Duration.zero,
      bodyRatio: 0.5,

      body: SlotLayout(
        config: {
          const Breakpoint(beginWidth: 0, endWidth: null): SlotLayout.from(
            key: const Key('Body all'),
            builder: (context) {
              return body;
            },
          ),
        },
      ),

      secondaryBody: SlotLayout(
        config: {
          const Breakpoint(
            beginWidth: AppBreakpoint.medium,
            endWidth: null,
          ): SlotLayout.from(
            key: const Key('SecondaryBody mediumAndLarge'),
            builder: (context) {
              return secondaryBody;
            },
          ),
        },
      ),
    );
  }
}
