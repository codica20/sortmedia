import 'package:flutter/material.dart';

import '../../home/ui/sm_scaffold.dart';


class SettingBaseWidget extends StatelessWidget {
  const new({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(20),
      margin: .directional(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius(),
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer,
      ),
      child: child,
    );
  }
}
