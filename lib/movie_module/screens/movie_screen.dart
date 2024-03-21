import 'package:api_app/movie_module/models/movie_model.dart';
import 'package:api_app/movie_module/screens/detail_screen.dart';
import 'package:api_app/movie_module/services/movie_services.dart';
import 'package:flutter/material.dart';

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
        // backgroundColor: Colors.blueAccent,
        title: Text(
          "Super Movies",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            return Text("Error Movie Reding:${snapshot.error.toString()}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildGridView(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildGridView(MovieModel movieModel) {
    if (movieModel == null) {
      return SizedBox();
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      itemCount: movieModel.results.length,
      itemBuilder: (context, index) {
        return _buildItem(movieModel.results[index]);
      },
    );
  }

  Widget _buildItem(Result item) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
            item
              ),
            ),
          );
        },
        child: Container(
          // width: 150,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                  "${item.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2, // 30% of the box
                child: Container(
                  // padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "${item.titleOrName}",
                      maxLines: 2, // Limit to 2 lines
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if exceeds 2 lines
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold), // Adjust font size as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
