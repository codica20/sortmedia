import 'package:flutter/material.dart' show ValueNotifier;
import 'package:get_it/get_it.dart' show GetIt;

enum RunningState { idle, running, aborting }

class RunningStateModel {
  final runningState = ValueNotifier<RunningState>(.idle);

  /// should be called in main()
  static void registerSingleton([
    RunningStateModel? runningStateModel,
  ]) {
    GetIt.instance.registerSingleton(
      runningStateModel ?? RunningStateModel(),
    );
  }
}

void setRunningState(RunningState rs) {
  GetIt.instance<RunningStateModel>().runningState.value =
      rs;
}

 RunningState getRunningState() =>
    GetIt.instance<RunningStateModel>().runningState.value;
