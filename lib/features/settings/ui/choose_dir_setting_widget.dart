import 'package:file_picker/file_picker.dart';
import 'package:material_ui/material_ui.dart';

import '../../home/ui/sm_scaffold.dart';

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
    return Container(
      padding: .all(20),
      margin: .directional(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius(),
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer,
      ),
      child: Wrap(
        direction: .horizontal,
        alignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          SelectableText(
            "$dirName: ${dir ?? "nicht gesetzt"}",
          ),

          Row(
            mainAxisSize: .min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final String? location =
                      await FilePicker.getDirectoryPath(
                        initialDirectory: dir,
                      );
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
          ),
        ],
      ),
    );
  }
}
