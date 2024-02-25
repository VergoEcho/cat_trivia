part of 'cat_facts_cubit.dart';

@immutable
abstract class CatFactsState {}

class CatFactsInitial extends CatFactsState {}
class CatFactsLoading extends CatFactsState {}

class CatFactsSuccess extends CatFactsState {
  final Uint8List image;
  final CatFact fact;

  CatFactsSuccess({required this.image, required this.fact});
}
