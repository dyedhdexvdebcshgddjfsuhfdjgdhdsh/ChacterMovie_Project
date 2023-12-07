import 'package:characters_project/bloc_layer/cubit.dart';
import 'package:characters_project/constansts/strings.dart';
import 'package:characters_project/data_layer/models.dart';
import 'package:characters_project/data_layer/repository.dart';
import 'package:characters_project/data_layer/webservies.dart';
import 'package:characters_project/presenation_layer/screens/characters.dart';
import 'package:flutter/material.dart';

import 'presenation_layer/screens/character_details.dart';

class AppRouter {
  late CharactersRepoSitory charactersRepoSitory;
  late ChactersCubit chactersCubit;
  AppRouter() {
    charactersRepoSitory = CharactersRepoSitory(CharactersWebservices());
    chactersCubit = ChactersCubit(charactersRepoSitory);
  }
  Route<dynamic> appRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => CharactersScreen());
      case charcter_details:
        final selectedCharcters = settings.arguments as Results;
        return MaterialPageRoute(
            builder: (context) =>
                CharactersDetailsScreen(character: selectedCharcters));
      default:
        return errorRoute();
    }
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Icon(
            Icons.no_adult_content,
            size: 20,
          ),
          Text('This Page is Not Found'),
        ],
      ),
    ),
  );
}
