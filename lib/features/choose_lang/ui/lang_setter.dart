import 'package:flutter/material.dart';
import 'package:sortmedia/l10n/app_localizations.dart';

import '../uistate/lang_state.dart'
    show LangState, langState;

import 'package:watch_it/watch_it.dart';

/// allows to switch between supported locales
/// click on it to choose the next available
/// language.
class LangSetter extends WatchingWidget {
  const LangSetter({super.key});

  @override
  Widget build(BuildContext context) {
    final chosenLang = watchPropertyValue(
      (LangState langState) => langState.lang,
    );

    langText(String? lang) =>
        lang?.toUpperCase() ??
        AppLocalizations.of(context)!.systemDefault;
    return TextButton(
      onPressed: () {
        langState.lang = _getNextLang(chosenLang);
      },
      child: Text(langText(chosenLang)),
    );
  }

  String? _getNextLang(String? currentLang) {
    final possibles = AppLocalizations.supportedLocales;
    if (currentLang == null) {
      return possibles[0].toLanguageTag();
    }
    for (int i = 0; i < possibles.length; i++) {
      if (possibles[i].toLanguageTag().compareTo(
            currentLang,
          ) ==
          0) {
        return i < possibles.length - 1
            ? possibles[i + 1].toLanguageTag()
            : null; // System default is at the end of the list.
      }
    }
    throw Exception(
      "ERROR: Language $currentLang not found.",
    );
  }
}
