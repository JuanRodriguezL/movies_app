
import 'package:app_movie/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  
   final List<Movie> movies;
   final String? title;

   const MovieSlider({super.key,
    required this.movies, 
     this.title});

 
 
@override
Widget build(BuildContext context){
return  SizedBox(
  width: double.infinity,
  height: 240,
  child:   Column(
crossAxisAlignment:  CrossAxisAlignment.start,
    children: [
      if(title!=null)
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ),
        ),
           const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
           itemCount: movies.length,
           scrollDirection: Axis.horizontal,
           itemBuilder: (_,int index) => _MoviePoster(movies[index]) ,
          ),
        )
      
    ]),
 
 );
  }
}


class _MoviePoster extends StatelessWidget {
  final Movie movie;

  // ignore: prefer_const_constructors_in_immutables
  _MoviePoster (this.movie);

 

  @override
  Widget build(BuildContext context) {
    return  Container(
             
              height: 190,
              width: 130,
              margin: const EdgeInsets.symmetric(horizontal: 10,),
              child:   Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                         "details",
                         arguments: "movie-instance");
                    },
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(20) ,
                      child:  FadeInImage(
                        placeholder: const AssetImage ("assets/no-image.jpg"), 
                        image: NetworkImage (movie.fullPoster),
                           height: 170,
                           width: 130,
                           fit: BoxFit.cover,
                        ),
                    ),
                  ),
                    const SizedBox(height: 5,),
                     Text(movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,)
                  
                    
                    

                ]
                ),
            );
  }
}