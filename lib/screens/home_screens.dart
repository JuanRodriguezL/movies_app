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
           onPressed: () {  },
           )
        ],

      ),
      body: const Center(
        child:Text("home_screen")
      ),
   
      
       

    );
  }
}