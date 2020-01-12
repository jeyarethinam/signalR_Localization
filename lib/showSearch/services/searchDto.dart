import 'dart:convert';

import 'package:research_and_development_ondemand/showSearch/model/model.dart';

import 'http_service.dart';

// import 'package:http/http.dart' as http;

const key = '802b2c4b88ea1183e50e6b285a27696e';

class SearchDto {
  Future<dynamic> getSearchedMovie(String query) async {
    final response = await get('/search/movie?api_key=$key&query=$query');
    // RestCommonBody body = new Deserialize(response).responseMessage();
    // print(response);
    if (response.statusCode == 200) {
     final result=  json.decode(response.body);
     print(result);
      final movie = result['results'].cast<Map<String, dynamic>>();
      final movieList = await movie.map<Movie>((json) {
        return Movie.fromJson(json);
      }).toList();
      return movieList;
    } else {
      return null;
    }
  }
}
