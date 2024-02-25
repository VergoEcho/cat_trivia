// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> uk = {
  "cat_fact_page": {
    "fact_button": "Інший Факт!",
    "history_button": "Попередні Факти",
    "error": "Помилка: Стан Cat fact загублено"
  },
  "cat_history_page": {
    "title": "Попередні Факти",
    "error": "Помилка: Стан Cat history загублено"
  }
};
static const Map<String,dynamic> en = {
  "cat_fact_page": {
    "fact_button": "Another Fact!",
    "history_button": "Fact History",
    "error": "Error: Cat fact state is loosed"
  },
  "cat_history_page": {
    "title": "Fact History",
    "error": "Error: Cat history state is loosed"
  }
};
static const Map<String,dynamic> fr = {
  "cat_fact_page": {
    "fact_button": "Un autre fait!",
    "history_button": "Historique des faits",
    "error": "Erreur: l'état 'Cat Fact' du chat est perdu"
  },
  "cat_history_page": {
    "title": "Historique des faits",
    "error": "Erreur: l'état 'Cat History' du chat est perdu"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"uk": uk, "en": en, "fr": fr};
}
