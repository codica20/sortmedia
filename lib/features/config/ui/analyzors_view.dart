import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import 'analyzor_config_widget_factory.dart';
import '../../analyze/uistate/analyzor_list.dart'
    show AnalyzorList;

class AnalyzorsView extends WatchingWidget {
  const AnalyzorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final anlyzrs = watchIt<AnalyzorList>().analyzors;
    return ListView.builder(
      itemCount: anlyzrs.length,

      itemBuilder: (context, index) {
        return AnalyzorConfigWidgetFactory.createAnalyzorConfigWidget(
          index,
        );
      },
    );
  }
}
