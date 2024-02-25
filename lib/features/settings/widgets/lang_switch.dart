import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({super.key, this.margin});

  final EdgeInsets? margin;

  _switchLang(BuildContext context) {
    int currentIndex = context.supportedLocales.indexOf(context.locale);
    int nextIndex = (currentIndex + 1) % context.supportedLocales.length;
    context.setLocale(context.supportedLocales[nextIndex]);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CupertinoButton(
        onPressed: () => _switchLang(context),
        child: Text(
          context.locale.languageCode.toUpperCase(),
          style: textTheme.labelLarge,
        ),
      ),
    );
  }
}
