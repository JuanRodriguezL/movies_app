

import 'package:app_movie/models/now_playing_response.dart';
import 'package:flutter/material.dart';




import 'package:http/http.dart' as http;


class MovieProvider extends ChangeNotifier{

  final String _baseUrl="api.themoviedb.org";
   final String _apiKey="f024743f7e81694c31dd41a76c33768c";
    final String _language="es-ES";


  MovieProvider(){
    // ignore: avoid_print
    print("iniciañlizacion de movieprovider");
    // ignore: unnecessary_this
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
       "api_key":_apiKey,"language":_language,"page": "1" });

        var response = await http.get(url);
       
        final decodeData = NowPlayingResponse.fromJson(response.body);
        // ignore: avoid_print
        print(decodeData.results[0].title);
        

          
 
 

  }
}