

import 'package:bloc_test/data/web_servicess/character_web_services.dart';
import 'package:bloc_test/inject.dart';

import '../models/charater_result.dart';

class CharactersRepository{
Future<CharactersResult>getAllCharacters()async{
  return await locator.get<CharactersWebServices>().getAllCharacters();
}

}