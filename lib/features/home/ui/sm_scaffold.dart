import 'package:flutter/material.dart';

import '../../navigation/ui/nav_bar.dart';

/// a scaffold for sort_media screens
class SmScaffold extends StatelessWidget {
  const SmScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context)
        .colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Text("$title - Sort Media 0.3.2"),
      ),
      body: child,
      bottomNavigationBar: NavBar(),
    );
  }
}

Padding defaultPadding(Widget w) =>
    Padding(padding: .all(20), child: w);

BorderRadius defaultBorderRadius() =>
    BorderRadius.circular(10);
