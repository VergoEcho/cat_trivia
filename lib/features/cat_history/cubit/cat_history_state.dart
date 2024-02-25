part of 'cat_history_cubit.dart';

@immutable
abstract class CatHistoryState {}

class CatHistoryInitial extends CatHistoryState {}
class CatHistoryLoading extends CatHistoryState {}
class CatHistorySuccess extends CatHistoryState {
  final List<CatFact> facts;

  CatHistorySuccess(this.facts);
}
