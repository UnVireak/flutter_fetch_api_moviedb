import 'package:flutter/foundation.dart';
import 'package:api_app/movie_module/models/movie_model.dart';
import 'package:http/http.dart' as http;

const global_api = "c9bf64284ced27a2e9f65ba8403d2a24";

class MovieService {
  static Future<MovieModel> getAPI() async {
    try {
      http.Response response= await http.get(Uri.parse(
          "https://api.themoviedb.org/3/trending/all/day?language=en-US&api_key=$global_api"));
      return compute(movieModelFromMap, response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
