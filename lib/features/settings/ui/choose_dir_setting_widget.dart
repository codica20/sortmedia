import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sortmedia/l10n/app_localizations.dart';

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
    getTranslation() => AppLocalizations.of(context)!;
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
            "$dirName: ${dir ?? getTranslation().notSet}",
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
                  if (location != null) {
                    log(getTranslation().picked(location));
                    setDir(location);
                  }
                },
                child: Text(
                  getTranslation().choose(dirName),
                ),
              ),
              IconButton(
                onPressed: () {
                  log(getTranslation().removed(dirName));
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
