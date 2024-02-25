import 'package:cat_trivia/features/cat_history/cat_history.dart';
import 'package:cat_trivia/features/settings/settings.dart';
import 'package:cat_trivia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cat_facts_cubit.dart';

class CatFactPage extends StatelessWidget {
  const CatFactPage({super.key});

  static const String route = '/';

  void _loadFact(BuildContext context) {
    final controller = context.read<CatFactsCubit>();
    controller.loadFact();
  }

  Future<void> _toCatHistory(BuildContext context) async {
    await context.read<CatHistoryCubit>().loadHistory();
    if (context.mounted) {
      Navigator.of(context).pushNamed(CatHistoryPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          LangSwitch(
            margin: EdgeInsets.only(right: 8),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<CatFactsCubit, CatFactsState>(
                  builder: (context, state) {
                    if (state is CatFactsLoading || state is CatFactsInitial) {
                      return CircularProgressIndicator(
                        color: colorScheme.secondary,
                      );
                    }
                    if (state is CatFactsSuccess) {
                      return ListView(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 48,
                        ),
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.memory(
                              state.image,
                              height: 300,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            state.fact.text,
                            textAlign: TextAlign.center,
                            style: textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            DateFormat('dd/MM/y').format(state.fact.updatedAt),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                    return const Text(LocaleKeys.cat_fact_page_error).tr();
                  },
                ),
              ),
            ),
            CupertinoButton.filled(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              onPressed: () => _loadFact(context),
              child: const Text(LocaleKeys.cat_fact_page_fact_button).tr(),
            ),
            CupertinoButton(
              child: const Text(LocaleKeys.cat_fact_page_history_button).tr(),
              onPressed: () => _toCatHistory(context),
            )
          ],
        ),
      ),
    );
  }
}
