import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cat_trivia.dart';
import 'features/cat_fact/cat_fact.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CatFactAdapter());

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('uk'),
        Locale('fr'),
      ],
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      path: 'assets/locales',
      child: const CatTrivia(),
    ),
  );
}
