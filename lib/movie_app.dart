import 'package:flutter/material.dart';
import 'package:api_app/screens/movie_screen.dart';
import 'package:flutter/widgets.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen()
    );
  }
}