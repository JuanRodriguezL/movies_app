import 'package:app_movie/models/movie.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
 
    return   Scaffold(
      body:  CustomScrollView(
       slivers: [
         _CustomAppBar(movie),
        SliverList(
          delegate: SliverChildListDelegate ([

            _PosterAndTitle(movie),
            _Overvieew(movie),
          
          ])
        )
       ],
      ), 
   
      
       

    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
    const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
  flexibleSpace: FlexibleSpaceBar(
    centerTitle: true,
    titlePadding: const EdgeInsets.all(0),
    title: Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 10),
      color: Colors.black12,
      child: Text(
        movie.title
      ),
      
    ),
    background: FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(movie.fullBackdropPath),
    ),
      
  ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
   final Movie movie;
 const _PosterAndTitle(this.movie);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child:  FadeInImage(
              image: NetworkImage(movie.fullPoster) ,
              placeholder:const AssetImage("assets/no-image.jpg"),
              height: 150,
              ),
          ),
          const SizedBox( width: 20,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(movie.title),
              Text(movie.originalTitle),
              Row(
                children: [
                  const Icon(Icons.star_outline,size: 15,color: Colors.amber,),
                Text('${movie.voteAverage}')
                ],)
            ],)
        ]
        ),
    );
  }
}

class _Overvieew extends StatelessWidget {
   final Movie movie;

  const _Overvieew(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(                   
      padding: const EdgeInsets.symmetric(horizontal: 20,
      vertical: 15),
      child:   Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.bodyMedium,)
    );
  }
}