import 'package:characters_project/constansts/strings.dart';
import 'package:characters_project/data_layer/models.dart';
import 'package:dio/dio.dart';

//retrofit
// part 'webservies.g.dart';
//
// @RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
// abstract class CharactersWebServices {
//   factory CharactersWebServices(Dio dio, {String baseUrl}) =
//       _CharactersWebServices;
//
//   @GET('character')
//   Future<List<Results>> getAllCharacters();
// }

class CharactersWebservices {
  Dio dio = Dio();
  CharactersWebservices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        receiveDataWhenStatusError: true);

    dio = Dio(options);
  }
  Future<List<Results>> getAllCharacters() async {
    try {
      var response = await dio.get('character');
      // print(response.data.toString());
      print("CharactersWebservices : ${response.data}");
      return response.data;
    } catch (error) {
      print('Error is $error');
      return [];
    }
  }
}
