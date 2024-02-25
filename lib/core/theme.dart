import 'package:cat_trivia/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  return Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: CatColors.black,
          displayColor: CatColors.black,
        ),
    scaffoldBackgroundColor: CatColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: CatColors.white,
      surfaceTintColor: CatColors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: CatColors.white,
      accentColor: CatColors.black,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryContrastingColor: CatColors.white,
      primaryColor: CatColors.black,
    ),
  );
}
