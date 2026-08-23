import 'package:flutter/material.dart';
import '../../home/ui/sm_scaffold.dart';

import '../../analyze/engine/analyze.dart';

class AnalyzorsView extends StatelessWidget {
  const AnalyzorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final anlyzrs = analyzors;
    return ListView.builder(
      itemCount: anlyzrs.length,

      itemBuilder: (context, index) => ListTile(
        title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer,
            borderRadius: defaultBorderRadius(),
          ),
          child: defaultPadding(Text(anlyzrs[index].name)),
        ),
      ),
    );
  }
}
