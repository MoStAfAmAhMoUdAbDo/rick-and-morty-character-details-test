
import 'package:json_annotation/json_annotation.dart';

import 'characters.dart';

part 'charater_result.g.dart';

@JsonSerializable()
class CharactersResult{

  @JsonKey(name: "results")
  List<CharactersModel>? characters;

  CharactersResult({this.characters});
  factory CharactersResult.fromJson(Map<String, dynamic> json) => _$CharactersResultFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CharactersResultToJson(this);
}