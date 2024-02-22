import 'package:json_annotation/json_annotation.dart';

part 'origin.g.dart';


@JsonSerializable()
class Origin  {

  String? name;
  String? url;

  Origin({this.name, this.url});


  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}