import 'package:material_ui/material_ui.dart';
import 'package:watch_it/watch_it.dart';

class CurrentScreenModel {
  final currentScreenNr = ValueNotifier<int>(0);
  void setScreenNr(int newNr) {
    currentScreenNr.value = newNr;
  }
}

void registerCurrentScreenModel() {
  GetIt.instance.registerSingleton(CurrentScreenModel());
}

void setCurrentScreenNr(int newNr) {
  GetIt.instance<CurrentScreenModel>().setScreenNr(newNr);
}

class NavDest {
  NavDest(this.icon, this.label, this.path);
  IconData icon;
  String label;
  String path;
}

/// lists the screens you can navigate to via teh NavBar
/// See also routes in main.dart
List<NavDest> navDests = [
  NavDest(Icons.home, "Übersicht", "/"),
  NavDest(Icons.settings, "Konfiguration", "/config"),
  NavDest(Icons.bug_report, "Logs", "/logs"),
];
