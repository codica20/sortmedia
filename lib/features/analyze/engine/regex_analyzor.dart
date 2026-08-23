import 'dart:io' show File;

import 'package:path/path.dart' show basename;

import '../../log/uistate/logger.dart';
import 'analyzor.dart';

/// provides an analyzor for the basename of the source path.
/// That is it tries to match the regex pattern against the
/// basename of the source file's path. E.g. given a source
/// file input/20260714_120233.jpg, the regex is matched
/// against 20260714_120233.jpg.
/// The regex requires two named groups year and month.
/// Optionally, it could contain day, hour, minute and
/// second.
/// Example for a regex: RegExp(r`^(?<year>\d\d\d\d)(?<month>\d\d)(?<day>\d\d)_(?<hour>\d\d)(?<minute>\d\d)(?<second>\d\d).jpg$`)
class RegExAnalyzor extends Analyzor {
  RegExAnalyzor({
    required this.regex,
    String? analyzorName,
  }) {
    _name = analyzorName;
  }

  final RegExp regex;
  late final String? _name;

  @override
  Future<AnalyzeData?> analyzeFile(File file) async {
    try {
      final fileBasename = basename(file.path);
      final match = regex.firstMatch(fileBasename);
      if (match == null) {
        log("Regex $regex has not matched $fileBasename.");
        return null;
      }
      final int year = _requiredNamedGroupAsInt(
        match,
        "year",
      );
      final int month = _requiredNamedGroupAsInt(
        match,
        "month",
      );

      final int day = _optionalNamedGroupAsInt(
        match,
        "day",
      );
      final int hour = _optionalNamedGroupAsInt(
        match,
        "hour",
      );
      final int minute = _optionalNamedGroupAsInt(
        match,
        "minute",
      );
      final int second = _optionalNamedGroupAsInt(
        match,
        "second",
      );

      final DateTime shotTime = DateTime(
        year,
        month,
        day,
        hour,
        minute,
        second,
      );

      return AnalyzeData(
        name,
        file.path,
        shotTime,
      ); // success
    } catch (e) {
      log("RegEx $regex could not be applied to $file: $e");
      return null;
    }
  }

  @override
  String get name => _name ?? "Regex: $regex";
}

/// throws an error, if group is not available
int _requiredNamedGroupAsInt(
  RegExpMatch match,
  String groupName,
) {
  final resultStr = match.namedGroup(groupName);
  if (resultStr == null) {
    throw FormatException(
      "Regulärer Ausdruck ${match.pattern} hat keine Gruppe $groupName.",
    );
  }
  return int.parse(resultStr);
}

/// returns 1, if group is not avaliable
int _optionalNamedGroupAsInt(
  RegExpMatch match,
  String groupName,
) {
  final resultStr = match.namedGroup(groupName);
  if (resultStr == null) {
    log(
      "Regulärer Ausdruck ${match.pattern} hat keine Gruppe $groupName.",
    );
    return 1;
  }
  try {
    return int.parse(resultStr);
  } catch (e) {
    log(
      "RegEx problem: $e - $resultStr - $groupName - regex:${match.pattern} str:${match.input}",
    );
    return 1;
  }
}
