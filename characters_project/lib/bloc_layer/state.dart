import 'package:characters_project/data_layer/models.dart';

class MyState {}

class initalState extends MyState {}

//retrofit
// class getAllChactersState extends MyState {
//   final List<Results> allChactersList;
//   getAllChactersState(this.allChactersList);
// }

class LoadedGetAllCharactersState extends MyState {
  List<Results> characters;
  LoadedGetAllCharactersState(this.characters);
}
