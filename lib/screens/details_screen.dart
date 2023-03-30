import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
// final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";

    return   Scaffold(
      body:  CustomScrollView(
       slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate ([

            _PosterAndTitle(),
            _Overvieew(),
           _Overvieew()
          ])
        )
       ],
      ), 
   
      
       

    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

 
  @override
  Widget build(BuildContext context) {
    return  const SliverAppBar(
      backgroundColor: Colors.indigo,
      pinned: true,
  flexibleSpace: FlexibleSpaceBar(
    centerTitle: true,
    title: Text("movie-title"),
      
  ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage("https://via.placeholder.com/200x300") ,
              placeholder: AssetImage("assets/no-image.jpg"),
              height: 150,
              ),
          ),
          const SizedBox( width: 20,),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("title.title"),
              Text("movie.original"),
              Row(
                children: [
                  Icon(Icons.star_outline,size: 15,color: Colors.amber,)
                ],)
            ],)
        ]
        ),
    );
  }
}

class _Overvieew extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,
      vertical: 10),
      child:   Text("Sint ad nulla id irure sit fugiat laboris ea laborum officia. Eiusmod consequat excepteur adipisicing sit incididunt nulla incididunt culpa nostrud officia nisi est labore anim. Cupidatat ullamco et et nulla minim aliqua laboris consectetur dolore in proident anim. Commodo reprehenderit sint ad eu Lorem magna tempor velit veniam amet enim cupidatat laboris. Laboris voluptate adipisicing enim nostrud cupidatat magna ut excepteur dolore ad.",
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.bodyMedium,)
    );
  }
}