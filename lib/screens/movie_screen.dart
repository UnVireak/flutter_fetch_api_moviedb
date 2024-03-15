import 'package:api_app/movie_module/models/movie_model.dart';
import 'package:api_app/services/movie_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: FutureBuilder<MovieModel>(
        future: MovieService.getAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error Movie Reading: ${snapshot.error.toString()}");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Data:${snapshot.data!.results}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
