import 'package:bloc/bloc.dart';
import 'package:cat_trivia/features/cat_fact/cat_fact.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'cat_history_state.dart';

class CatHistoryCubit extends Cubit<CatHistoryState> {
  CatHistoryCubit() : super(CatHistoryInitial());

  Future<void> loadHistory() async {
    emit(CatHistoryLoading());
    final box = await Hive.openBox<CatFact>('facts');
    List<CatFact> facts = box.values.toList();
    await box.close();
    emit(CatHistorySuccess(facts));
  }
}
