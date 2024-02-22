import 'package:bloc_test/data/models/characters.dart';
import 'package:bloc_test/data/repository/character_repository.dart';
import 'package:bloc_test/presentation/screens/character_details.dart';
import 'package:bloc_test/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/characters_cubit.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepository charactersRepository;

  AppRouter() {
    charactersRepository = CharactersRepository();
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRout(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        final character=routeSettings.arguments as CharactersModel;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(charactersModel: character,));
    }
  }
}
