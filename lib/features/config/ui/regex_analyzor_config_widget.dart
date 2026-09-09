import 'package:flutter/material.dart';
import 'package:sortmedia/features/config/ui/analyzor_config_widget.dart';

import '../../analyze/engine/regex_analyzor.dart';


class RegexAnalyzorConfigWidget
    extends AnalyzorConfigWidget {
  @override
  // ignore: overridden_fields
  final RegExAnalyzor analyzor;
  const RegexAnalyzorConfigWidget({
    super.key,
    required this.analyzor,
    required super.setEnabled,
  }) : super(analyzor: analyzor);

  @protected
  @override
  Widget buildTitle(BuildContext context) {
    return Text("Dateinamenanalyse");
  }

  @protected
  @override
  Widget? buildSubtitle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: .only(top: 15),
      child: Wrap(
        crossAxisAlignment: .center,
        children: [
          Text(
            "Regulärer Ausdruck:",
            style: textTheme.labelMedium,
          ),
          Text(
            "${analyzor.regex}",
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
