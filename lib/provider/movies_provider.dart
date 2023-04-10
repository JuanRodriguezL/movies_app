

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

  
  int _popularPage = 0;

  MovieProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
   
        final jsonData = await _getJsonData('/3/movie/now_playing'); 
        final decodeData = NowPlayingResponse.fromJson(jsonData);
        onDisplayMovies = decodeData.results;
        notifyListeners();

  }
  Future <String>_getJsonData(String endPoint, [int page=1]) async {

    var url = Uri.https(_baseUrl, endPoint, {
       "api_key":_apiKey,
       "language":_language,
       "page": "$page" 
       });
        final response = await http.get(url);
        return response.body;
  }

  getPopularMovies() async{
        
     _popularPage++;

        final jsonData = await _getJsonData('/3/movie/popular',_popularPage); 
        final decodeDataPopularResponse = PopularResponse.fromJson(jsonData);
        onPopularMovies = [ ...onPopularMovies, ...decodeDataPopularResponse.results];
        notifyListeners();


  }
}