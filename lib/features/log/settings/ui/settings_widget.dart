import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../uistate/logger.dart';

class SettingsWidget extends WatchingWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final String? location =
                await FilePicker.getDirectoryPath();
            log('Picked: $location');
          },
          child: Text("Wähle Quellverzeichnis"),
        ),
      ],
    );
  }
}
