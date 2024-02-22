
import 'origin.dart';
import 'package:json_annotation/json_annotation.dart';

part 'characters.g.dart';

@JsonSerializable()
class CharactersModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  CharactersModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created});

  factory CharactersModel.fromJson(Map<String, dynamic> json) => _$CharactersModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
}