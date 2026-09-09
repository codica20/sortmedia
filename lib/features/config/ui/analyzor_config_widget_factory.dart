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
    final analyzorList = GetIt.instance<AnalyzorList>();
    final analyzor =
        analyzorList.analyzors[analyzorListNumber];
    void setEnabled(enabled) {
      analyzorList.enableAnalyzor(
        analyzorNr: analyzorListNumber,
        enabled: enabled,
      );
    }

    return switch (analyzor) {
      RegExAnalyzor() => RegexAnalyzorConfigWidget(
        analyzor: analyzor,
        setEnabled: setEnabled,
      ),
      Analyzor() => AnalyzorConfigWidget(
        analyzor: analyzor,
        setEnabled: setEnabled,
      ),
    };
  }
}
