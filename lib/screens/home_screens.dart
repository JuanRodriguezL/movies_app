
import 'package:app_movie/provider/movies_provider.dart';
import 'package:app_movie/search/search.dart';
import 'package:app_movie/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {

  


  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MovieProvider>(context);

    return     Scaffold(
      appBar: AppBar(
        title: const Text("appbar"),
        elevation: 0,
        actions:  [
          IconButton(
          icon: const Icon (Icons.search),
           onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
           )
        ],

      ),
      body:    SingleChildScrollView(
        child: Column(
        children:[
          CardSwiper(movies: movieProvider.onDisplayMovies),

           MovieSlider(
            movies: movieProvider.onPopularMovies,
            title: "Populares",
            onNextPage:()=> movieProvider.getPopularMovies(),
             ),
        
          
          
        ],
   
    )
      )
    );
  }
}