import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../features/log/uistate/logger.dart';

class ChooseDirSettingWidget extends StatelessWidget {
  const new({
    super.key,
    required this.dirName,
    required this.dir,
    required this.setDir,
  });

  final String dirName;
  final String? dir;
  final void Function(String? dir) setDir;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text("$dirName: ${dir ?? "nicht gesetzt"}"),
        ElevatedButton(
          onPressed: () async {
            final String? location =
                await FilePicker.getDirectoryPath();
            log('Picked: $location');
            if (location != null) {
              setDir(location);
            }
          },
          child: Text("Wähle $dirName"),
        ),
        IconButton(
          onPressed: () {
            log("$dirName entfernt.");
            setDir(null);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
