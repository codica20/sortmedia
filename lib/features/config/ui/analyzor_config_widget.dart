import 'package:flutter/material.dart';
import 'package:sortmedia/features/analyze/engine/analyzor.dart';

import '../../home/ui/sm_scaffold.dart'
    show defaultBorderRadius, defaultPadding;

class AnalyzorConfigWidget extends StatelessWidget {
  final Analyzor analyzor;
  const AnalyzorConfigWidget({
    super.key,
    required this.analyzor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .secondaryContainer,
          borderRadius: defaultBorderRadius(),
        ),
        child: defaultPadding(Text(analyzor.name)),
      ),
    );
  }
}
