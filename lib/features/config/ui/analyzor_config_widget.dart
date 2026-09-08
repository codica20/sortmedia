import 'package:flutter/material.dart';
import 'package:sortmedia/features/analyze/engine/analyzor.dart';

import '../../home/ui/sm_scaffold.dart'
    show defaultBorderRadius, defaultPadding;

class AnalyzorConfigWidget extends StatelessWidget {
  final Analyzor analyzor;
  final void Function(bool enabled) setEnabled;

  const AnalyzorConfigWidget({
    super.key,
    required this.analyzor,
    required this.setEnabled,
  });

  @protected
  Widget buildTitle(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context)
          .colorScheme
          .secondaryContainer,
      borderRadius: defaultBorderRadius(),
    ),
    child: defaultPadding(Text(analyzor.getName())),
  );

  @protected
  Widget? buildSubtitle(BuildContext context) => null;

  @protected
  Widget? buildLeading(BuildContext context) => Checkbox(
    value: analyzor.enabled,
    onChanged: (newValue) {
      setEnabled(newValue ?? false);
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildLeading(context),
      title: buildTitle(context),
      subtitle: buildSubtitle(context),
    );
  }
}
