


import 'package:app_movie/provider/movies_provider.dart';
import 'package:app_movie/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(  const AppState());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

 
@override
Widget build(BuildContext context){
return MultiProvider(
  providers: [
  ChangeNotifierProvider(create:(_) => MovieProvider(),lazy: false, )
  ],
  child: MyApp(),
  );
  }
}


// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: "home",
      routes: {
        'home':(_) =>   HomeScreen(),
        'details':(_) =>   DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
     
    );
   
      
  }
}

