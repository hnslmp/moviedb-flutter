import 'package:flutter/material.dart';
import 'package:moviedb_flutter/model/response/movielist_response.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieObject movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState(movie: movie);
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieObject movie;
  _MovieDetailPageState({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.network(movie.posterUrl()).image,
            )),
            width: MediaQuery.of(context).size.width,
            height: 400,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Text(movie.title,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        movie.overview,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ]),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
