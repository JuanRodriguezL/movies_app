import 'package:app_movie/models/movie.dart';
import 'package:app_movie/provider/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{
 
 @override
  String? get searchFieldLabel => "Buscar Pelicula";
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton( 
        icon: const Icon(Icons.clear),
        onPressed: () => query = "",

        
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return   IconButton(
       icon: const Icon(Icons.arrow_back ),
       onPressed: () {
        close(context, null);
       },
       );
  }

  @override
  Widget buildResults(BuildContext context) {
    
     return   const Text("buildResults");
  }

  
  Widget _emptyContainer(){
    // ignore: avoid_unnecessary_containers
    return  Container(
      child: const Center(
        child: Icon(Icons.movie_creation_outlined,color: Colors.black38,),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   
   if (query.isEmpty){
    return  _emptyContainer();
   }

   final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    
     return  FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (_ ,AsyncSnapshot<List<Movie>> snapshot){
          if(!snapshot.hasData) return _emptyContainer();

          final movies = snapshot.data;
       return ListView.builder(
        itemCount: movies!.length,
        // ignore: avoid_print
         itemBuilder: (_, int index) =>_MovieItem(movies[index]) ,
       );
      },);

}

}

class _MovieItem extends StatelessWidget {
 final Movie movie;
 const _MovieItem( this.movie) ;
 
@override
Widget build(BuildContext context){
return  ListTile(
   leading: FadeInImage(
    placeholder: const AssetImage('assets/no-image.jpg'),
    image: NetworkImage(movie.fullPoster),
    width: 50,
    fit: BoxFit.contain,

   ),
   title:  Text(movie.title),
   subtitle: Text(movie.originalTitle),
   onTap: () {
    Navigator.pushNamed(context, 'details', arguments:movie);
   },
 );
  }
}