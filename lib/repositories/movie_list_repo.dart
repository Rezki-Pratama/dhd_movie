
import 'dart:convert';

import 'package:dhd_movie/model/movie_list_model.dart';
import 'package:http/http.dart' as http;

class MovieListRepositories {
  static Future<List<MovieListModel>> getMovieList() async {
    String apiUrl =
        "http://api.themoviedb.org/3/movie/now_playing?api_key=2ad724f8d9ca0dd24428cdd6535a8683";
    var response = await http.get(apiUrl);
    var jsonObject = json.decode(response.body);
    var listObject = jsonObject['results'] as List;
    if (response.statusCode == 200) {
      return listObject
          .map<MovieListModel>((item) => MovieListModel(
              id: item['id'],
              title: item['title'],
              voteAverage: item['vote_average'].toDouble(),
              posterPath: item['poster_path'],
              ))
          .toList();
    } else {
      throw 'Error Exception';
    }
  }
}