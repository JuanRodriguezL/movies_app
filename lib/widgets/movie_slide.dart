
import 'package:app_movie/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  
   final List<Movie> movies;
   final String? title;
   final Function onNextPage;

   const MovieSlider({
   Key? key,
    required this.movies, 
     this.title,
    required this.onNextPage}):
    super(key:key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {


final ScrollController scrollController =  ScrollController();



@override
void initState() {
  super.initState();
  scrollController.addListener(() {
    if (scrollController.position.pixels>=scrollController.position.maxScrollExtent-500){
           widget.onNextPage();
    }

  });
  
}
@override
  void dispose() {
    super.dispose();
  }

@override
Widget build(BuildContext context){
return  SizedBox(
  width: double.infinity,
  height: 250,
  child:   Column(
crossAxisAlignment:  CrossAxisAlignment.start,
    children: [
      if(widget.title!=null)
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Text(widget.title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ),
        ),
           
        Expanded(
          child: ListView.builder(
          controller: scrollController,
           itemCount: widget.movies.length,
           scrollDirection: Axis.horizontal,
           itemBuilder: (_,int index) => _MoviePoster(widget.movies[index]) ,
          ),
        )
      
    ]),
 
 );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster (this.movie);
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
                         arguments: movie);
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
                     Text(movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,)
                ]
                ),
            );
  }
}