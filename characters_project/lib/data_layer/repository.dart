import 'package:characters_project/data_layer/models.dart';
import 'package:characters_project/data_layer/webservies.dart';

class CharactersRepoSitory {
  final CharactersWebservices charactersWebServices;
  CharactersRepoSitory(this.charactersWebServices);

  // method might put name fetechData or retriveData or getData ...
  Future<List<Results>> getAllCharacters() async {
    var response = await charactersWebServices.getAllCharacters();
    print("CharactersRepository : $response");
    return response
        .map((characters) => Results.fromJson(characters.toJson()))
        .toList();
  }
}
