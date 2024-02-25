import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/api/api_client.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

part 'cat_facts_state.dart';

class CatFactsCubit extends Cubit<CatFactsState> {
  CatFactsCubit(this.apiClient) : super(CatFactsInitial());

  final ApiClient apiClient;

  Future<void> _addFact(CatFact fact) async {
    final box = await Hive.openBox<CatFact>('facts');
    box.add(fact);
    await box.close();
  }

  Future<void> loadFact() async {
    emit(CatFactsLoading());
    CatFact fact = await apiClient.getCatFact();
    List<int> image = await apiClient.getCatImage();

    await _addFact(fact);

    emit(CatFactsSuccess(
      image: Uint8List.fromList(image),
      fact: fact,
    ));
  }
}
