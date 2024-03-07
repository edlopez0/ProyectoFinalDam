import 'package:http/http.dart'as http;

import 'dart:convert' as convert;

import '../Modelos/Gif.dart';



class HttpAdmin{

  HttpAdmin();





  Future<List<Gifs>> obtenerGifs() async {
    var url = Uri.http('api.giphy.com', '/v1/gifs/trending', {
      'api_key': 'Ch0XJQ0GVFHMJyREIO7GxubWn9FQiBIh',
      'limit': '10',
      'offset': '0',
      'rating': 'g',
      'bundle': 'messaging_non_clips',
    });

    var respuesta = await http.get(url);
    List<Gifs> gifs = [];
    if (respuesta.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(respuesta.body) as Map<String, dynamic>;
      print(jsonResponse.toString());

      for (var item in jsonResponse["data"]) {
        gifs.add(Gifs(title: item["title"],url:item["images"]["downsized"]["url"]));
        print(gifs.toString());
      }

      return gifs;
    } else {
      throw Exception("Error de conexión: ${respuesta.statusCode}");
    }
  }





}