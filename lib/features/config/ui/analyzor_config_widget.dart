import 'package:material_ui/material_ui.dart';
import 'package:sortmedia/features/analyze/engine/analyzor.dart';

import '../../home/ui/sm_scaffold.dart'
    show defaultBorderRadius;

class AnalyzorConfigWidget extends StatelessWidget {
  final Analyzor analyzor;
  final void Function(bool enabled) setEnabled;

  const AnalyzorConfigWidget({
    super.key,
    required this.analyzor,
    required this.setEnabled,
  });

  @protected
  Widget buildTitle(BuildContext context) =>
      Text(analyzor.getName());

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
    return Padding(
      padding: .only(bottom: 20, left: 20, right: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: defaultBorderRadius(),
        ),

        tileColor: Theme.of(context)
            .colorScheme
            .secondaryContainer, // Theme.of(context).colorScheme.onSecondary,
        leading: buildLeading(context),
        title: buildTitle(context),
        subtitle: buildSubtitle(context),
      ),
    );
  }
}
