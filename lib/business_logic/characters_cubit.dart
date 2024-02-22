import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/charater_result.dart';
import '../data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
    final CharactersRepository charactersRepository;
    late CharactersResult charactersResult;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<CharactersResult> getAllCharacters()async{
    //emit(CharactersLoading());
    // charactersRepository.getAllCharacters().then((characters){
    //   emit(CharactersLoaded(characters));
    //   charactersResult=characters;
    // });
    charactersResult= await charactersRepository.getAllCharacters();
    emit(CharactersLoaded(charactersResult));
    return charactersResult;
  }
}
