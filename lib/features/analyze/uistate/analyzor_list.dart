import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../engine/analyzor.dart' show Analyzor;
import '../engine/exif_analyzor.dart';
import '../engine/regex_analyzor.dart';

class AnalyzorList extends ChangeNotifier {
  final List<Analyzor> _analyzors = [
    ExifAnalyzor(),
    RegExAnalyzor(
      regex: RegExp(
        r"(?<year>\d\d\d\d)(?<month>\d\d)(?<day>\d\d)_(?<hour>\d\d)(?<minute>\d\d)(?<second>\d\d)",
      ),
      //analyzorName: "MP4-DefaultFileName",
    ),
  ];

  List<Analyzor> get analyzors => _analyzors;
}

/// should be called in main()
void registerAnalyzorList() {
  GetIt.instance.registerSingleton(AnalyzorList());
}
