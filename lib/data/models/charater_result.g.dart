// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charater_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResult _$CharactersResultFromJson(Map<String, dynamic> json) =>
    CharactersResult(
      characters: (json['results'] as List<dynamic>?)
          ?.map((e) => CharactersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResultToJson(CharactersResult instance) =>
    <String, dynamic>{
      'results': instance.characters,
    };
