import 'package:characters_project/bloc_layer/state.dart';
import 'package:characters_project/data_layer/models.dart';
import 'package:characters_project/data_layer/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//retorfit
// class AppCubit extends Cubit<MyState> {
//   final CharactersRepoSitory myRepo;
//   AppCubit(this.myRepo) : super(initalState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//   void emitGetAllChacters() {
//     myRepo.getAllCharacters().then((characterList) {
//       emit(getAllChactersState(characterList));
//     });
//   }
// }
class ChactersCubit extends Cubit<MyState> {
  final CharactersRepoSitory charactersRepoSitory;
  List<Results> charactersList = [];
  ChactersCubit(this.charactersRepoSitory) : super(initalState());

  void getAllCharacters() {
    charactersRepoSitory.getAllCharacters().then((characters) {
      emit(LoadedGetAllCharactersState(characters));
      this.charactersList = characters;
      print("cubit : ${charactersList}");
    });
  }
}
