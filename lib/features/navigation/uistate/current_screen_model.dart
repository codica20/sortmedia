import 'package:flutter/material.dart';
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

List<NavDest> navDests = [
  NavDest(Icons.home, "Übersicht", "/"),
  NavDest(Icons.bug_report, "Logs", "/logs"),
];
