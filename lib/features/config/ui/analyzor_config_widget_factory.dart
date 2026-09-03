import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sortmedia/features/analyze/engine/regex_analyzor.dart';
import 'package:sortmedia/features/config/ui/regex_analyzor_config_widget.dart';

import '../../analyze/engine/analyzor.dart' show Analyzor;
import '../../analyze/uistate/analyzor_list.dart';
import 'analyzor_config_widget.dart';

class AnalyzorConfigWidgetFactory {
  /// returns an AnalyzorConfigWidget for the
  /// analyzor specified with with the
  /// analyzorListNumber in `GetIt.instance<AnalyzorList>()`
  static Widget createAnalyzorConfigWidget(
    int analyzorListNumber,
  ) {
    final Analyzor analyzor = GetIt.instance<AnalyzorList>()
        .analyzors[analyzorListNumber];
    return switch (analyzor) {
      RegExAnalyzor() => RegexAnalyzorConfigWidget(
        analyzor: analyzor,
      ),
      Analyzor() => AnalyzorConfigWidget(
        analyzor: analyzor,
      ),
    };
  }
}
