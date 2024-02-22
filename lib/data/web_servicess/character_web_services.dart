
import 'package:bloc_test/constants/strings.dart';
import 'package:bloc_test/data/models/characters.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/charater_result.dart';

part 'character_web_services.g.dart';
@RestApi(baseUrl:baseUrlApi)
abstract class CharactersWebServices{
  factory CharactersWebServices(Dio dio, {String baseUrl}) = _CharactersWebServices;
  @GET('character')
  Future<CharactersResult>getAllCharacters();
}
