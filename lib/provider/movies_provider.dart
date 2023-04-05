

import 'package:app_movie/models/now_playing_response.dart';
import 'package:app_movie/models/popular_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';


class MovieProvider extends ChangeNotifier{

  final String _baseUrl="api.themoviedb.org";
   final String _apiKey="f024743f7e81694c31dd41a76c33768c";
    final String _language="es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> onPopularMovies = [];

  MovieProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
       "api_key":_apiKey,"language":_language,"page": "1" });
        var response = await http.get(url);
        final decodeData = NowPlayingResponse.fromJson(response.body);
        onDisplayMovies = decodeData.results;
        notifyListeners();

  }

  getPopularMovies() async{

    var url = Uri.https(_baseUrl, '/3/movie/popular', {
       "api_key":_apiKey
       ,"language":_language,
       "page": "1" });
        var response = await http.get(url);
        final decodeDataPopularResponse = PopularResponse.fromJson(response.body);
        onPopularMovies = [...decodeDataPopularResponse.results];
        notifyListeners();


  }
}