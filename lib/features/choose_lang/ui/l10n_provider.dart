import 'package:flutter/material.dart';
import 'package:sortmedia/features/choose_lang/uistate/lang_state.dart';
import 'package:watch_it/watch_it.dart';

/// returns the child or wraps it if
/// langState is set
class L10nProvider extends WatchingWidget {
  final Widget child;

  const L10nProvider({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final lang = watchPropertyValue(
      (LangState langState) => langState.lang,
    );
    return lang is String
        ? Localizations.override(
            locale: Locale(lang),
            context: context,
            child: child,
          )
        : child;
  }
}
