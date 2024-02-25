import 'package:cat_trivia/features/cat_fact/cat_fact.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CatFactCard extends StatelessWidget {
  const CatFactCard(this.fact, {super.key, this.margin});

  final CatFact fact;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/y').format(fact.updatedAt),
              style: textTheme.labelSmall,
            ),
            const SizedBox(height: 8),
            Text(
              fact.text,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
