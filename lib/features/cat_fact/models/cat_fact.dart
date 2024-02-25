import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFact extends HiveObject {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final DateTime updatedAt;

  CatFact({required this.text, required this.updatedAt});

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
