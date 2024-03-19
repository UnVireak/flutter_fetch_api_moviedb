import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String banner;
  final String overview;
  final String originalLanguage;
  final String mediaType;
  final String releaseDate;

  const DetailScreen(
      {required this.title,
      required this.imageUrl,
      required this.banner,
      required this.overview,
      required this.originalLanguage,
      required this.mediaType,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${title}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // child: Text(
              //             title,
              //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //           ),
              ),
          Stack(
            children: [
              Container(
                height: 200, // Adjust the height as needed
                width: double.infinity, // Adjust the width as needed
                child: Image.network(
                  banner,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              Positioned(
                left: 0,
                bottom: 2,
                child: Container(
                  height: 110,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 177, 12,
                          111), // Choose your desired border color
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 220),
            child: Text(
              "Media Type: ${mediaType}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
            Container(
            margin: EdgeInsets.only(right: 25),
            child: Text(
              "Release date: ${releaseDate}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 200),
            child: Text(
              "Original language: ${originalLanguage}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 310),
            child: Text(
              "Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "${overview},",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
