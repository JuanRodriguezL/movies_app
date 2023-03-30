
import 'package:app_movie/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      appBar: AppBar(
        title: const Text("appbar"),
        elevation: 0,
        actions:  [
          IconButton(
          icon: const Icon (Icons.search),
           onPressed: () { 
           
            },
           )
        ],

      ),
      body:   const SingleChildScrollView(
        child: Column(
        children:[
          CardSwiper(),
          
          MovieSlider(),
          MovieSlider(),
          MovieSlider()
          
        ],
   
    )
      )
    );
  }
}