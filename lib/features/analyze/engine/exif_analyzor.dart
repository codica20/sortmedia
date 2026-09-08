import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:exif_reader/exif_reader.dart'
    show readExifFromBytes, ExifData;

import '../../log/uistate/logger.dart';
import 'analyzor.dart';

part "exif_analyzor.mapper.dart";

@MappableClass()
class ExifAnalyzor extends Analyzor
    with ExifAnalyzorMappable {
  new({required super.enabled});

  @override
  Future<AnalyzeData?> analyzeFile(File file) async {
    final fileContent = await file.readAsBytes();
    final exif = await readExifFromBytes(fileContent);
    //log("exif data: ${exif.tags}");
    if (exif.tags.isEmpty) {
      log("No EXIF in $file.");
      return null;
    }
    // log("${exif.tags["EXIF DateTimeDigitized"]}");
    // log("${exif.tags["EXIF DateTimeOriginal"]}");
    final dateTimeStr = exif.tags["EXIF DateTimeOriginal"];
    try {
      log("""${dateTimeStr?.tagType} 
        ${_dateTimeDigitized2dartDateTime(exif)}""");
      final data = AnalyzeData(
        getName(),
        file.path,
        _dateTimeDigitized2dartDateTime(exif),
      );
      return data; // success
    } catch (e) {
      log("The error in $file was $e.");

      return null;
    }
  }

  @override
  String getName() => "ExifAnalyzor";
}

DateTime _dateTimeDigitized2dartDateTime(ExifData exif) {
  final dateTimeStr = exif.tags["EXIF DateTimeOriginal"]
      .toString();
  if (dateTimeStr[4].compareTo(':') != 0 ||
      dateTimeStr[7].compareTo(':') != 0) {
    throw FormatException(
      "A colon (:) expected around month.$dateTimeStr",
    ); //, source: dateTimeStr);
  }
  final replaced = dateTimeStr
      .replaceRange(4, 5, '-')
      .replaceRange(7, 8, '-');

  return DateTime.parse(replaced);
}
