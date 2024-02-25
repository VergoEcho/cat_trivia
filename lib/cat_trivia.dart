import 'package:cat_trivia/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cat_fact/cat_fact.dart';
import 'features/cat_history/cat_history.dart';
import 'core/theme.dart';

class CatTrivia extends StatelessWidget {
  const CatTrivia({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatFactsCubit(ApiClient(Dio()))..loadFact(),
        ),
        BlocProvider(create: (context) => CatHistoryCubit())
      ],
      child: MaterialApp(
        theme: theme(context),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          CatFactPage.route: (context) => const CatFactPage(),
          CatHistoryPage.route: (context) => const CatHistoryPage(),
        },
      ),
    );
  }
}
