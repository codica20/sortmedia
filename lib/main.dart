import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart'
    show MapperContainer;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;
import 'package:sortmedia/features/choose_lang/ui/l10n_provider.dart';
import 'package:sortmedia/features/choose_lang/uistate/lang_state.dart';

import 'features/analyze/engine/analyzor.dart';
import 'features/analyze/engine/exif_analyzor.dart';
import 'features/analyze/engine/regex_analyzor.dart';
import 'features/analyze/uistate/analyzor_list.dart';
import 'features/config/ui/config_screen.dart';
import 'features/home/ui/home_screen.dart';
import 'features/log/ui/logs_screen.dart';
import 'features/log/uistate/logger.dart';
import 'features/navigation/uistate/current_screen_model.dart';
import 'features/settings/uistate/settings_state.dart';
import 'l10n/app_localizations.dart';
import 'utils/regexp_mapper.dart';

void main() {
  // initialize everything that has no flutter dependencies
  MapperContainer.globals.use(RegExpMapper());
  AnalyzorMapper.ensureInitialized();
  ExifAnalyzorMapper.ensureInitialized();
  RegExAnalyzorMapper.ensureInitialized();

  // initialize flutter and dependencies
  WidgetsFlutterBinding.ensureInitialized;
  registerLogger();
  registerSettingsState();
  registerLangState();
  registerCurrentScreenModel();
  registerAnalyzorList();

  // run app with catching unhandled exceptions
  runZonedGuarded(
    () {
      FlutterError.onError=(FlutterErrorDetails details) {
        log("Unhandled: $details");
        FlutterError.presentError(details);
      };
      runApp(const MyApp());
    },
    (dynamic error, StackTrace stackTrace) {
      log("Got an Error: $error");
      log("... with following stack: $stackTrace");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort Media',
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...flutter_localizations
            .GlobalMaterialLocalizations
            .delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      routes: {
        "/": (context) => const L10nProvider(
          child: HomeScreen(title: 'Sort Media'),
        ),
        "/config": (context) =>
            const L10nProvider(child: ConfigScreen()),
        "/logs": (context) =>
            const L10nProvider(child: LogsScreen()),
      },
    );
  }
}
