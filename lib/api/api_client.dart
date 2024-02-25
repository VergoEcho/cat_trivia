import 'package:cat_trivia/features/cat_fact/cat_fact.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('https://cataas.com/cat')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getCatImage();

  @GET('https://cat-fact.herokuapp.com/facts/random?animal_type=cat')
  Future<CatFact> getCatFact();
}