import 'package:flutter/material.dart';
import 'package:sortmedia/features/config/ui/analyzor_config_widget.dart';

import '../../analyze/engine/regex_analyzor.dart';

import '../../home/ui/sm_scaffold.dart'
    show defaultBorderRadius, defaultPadding;

class RegexAnalyzorConfigWidget
    extends AnalyzorConfigWidget {
  @override
  // ignore: overridden_fields
  final RegExAnalyzor analyzor;
  const RegexAnalyzorConfigWidget({
    super.key,
    required this.analyzor,
  }) : super(analyzor: analyzor);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .secondaryContainer,
          borderRadius: defaultBorderRadius(),
        ),
        child: defaultPadding(
          Wrap(
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
        ),
      ),
    );
  }
}
