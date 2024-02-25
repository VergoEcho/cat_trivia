import 'package:cat_trivia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/settings.dart';
import '../cubit/cat_history_cubit.dart';
import '../widgets/widgets.dart';

class CatHistoryPage extends StatelessWidget {
  const CatHistoryPage({super.key});

  static const String route = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          LocaleKeys.cat_history_page_title,
        ).tr(context: context),
        actions: const [
          LangSwitch(
            margin: EdgeInsets.only(right: 8),
          ),
        ],
      ),
      body: BlocBuilder<CatHistoryCubit, CatHistoryState>(
        builder: (context, state) {
          if (state is CatHistorySuccess) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                return CatFactCard(
                  state.facts[index],
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 24,
                  ),
                );
              },
            );
          }
          if (state is CatHistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: const Text(LocaleKeys.cat_history_page_error).tr(),
          );
        },
      ),
    );
  }
}
