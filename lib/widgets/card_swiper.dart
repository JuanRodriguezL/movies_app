import 'package:app_movie/models/movie.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies ;
   const CardSwiper({super.key,
   required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty){
      // ignore: sized_box_for_whitespace
      return Container(
        width: double.infinity,
        height: size.height*0.5,
        child: const Center(
          child: CircularProgressIndicator() ,
        ) 
        
      );
     }

    return Container(
      width: double.infinity,
      height: size.height*0.5,
      color: Colors.white,
      child: Swiper(itemCount: movies.length,
      layout: SwiperLayout.STACK,
      itemWidth: size.width *0.6,
      itemHeight: size.height * 0.4,
      itemBuilder: (_, int index) {
      final movie = movies[index];
        return GestureDetector (
          onTap: () => Navigator.pushNamed(context, "details",arguments:movie),
          child: ClipRRect (
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
            placeholder: const AssetImage ("assets/no-image.jpg"),
            image: NetworkImage(movie.fullPoster),
            fit: BoxFit.cover,
            ),
          ),
        );
        
      },),
      

    );
  }
}