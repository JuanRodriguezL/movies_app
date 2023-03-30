
import 'package:app_movie/widgets/widgets.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {


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