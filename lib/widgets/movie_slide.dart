
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

 
 
@override
Widget build(BuildContext context){
return  Container(
  color: Colors.red,
  width: double.infinity,
  height: 220,
  child:   Column(
crossAxisAlignment:  CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text("populares",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ),
        ),

        Expanded(
          child: ListView.builder(
           itemCount: 20,
           itemBuilder: (_,int index){
        
            return Container(
              color: Colors.amber,
              height: 190,
              width: 130,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            );
        
          }
          ),
        )
      
    ]),
 
 );
  }
}