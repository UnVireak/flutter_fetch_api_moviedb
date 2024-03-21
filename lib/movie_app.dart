import 'package:flutter/material.dart';
import 'package:api_app/movie_module/screens/movie_screen.dart';
import 'package:flutter/widgets.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen(),
      theme: ThemeData( 
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900]
        )
      ),
    );
  }
}