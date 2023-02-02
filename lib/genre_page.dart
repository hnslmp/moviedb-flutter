import 'package:flutter/material.dart';
import 'package:moviedb_flutter/services.dart';

import 'model/GenresResponse.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  GenresResponse? genresResponse;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  fetchGenres() async {
    genresResponse = await Services().fetchGenres();
    if (genresResponse != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your movie genre"),
      ),
      body: Visibility(
        child: ListView.builder(
            itemCount: genresResponse?.genres.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(genresResponse!.genres[index].name),
                trailing: const Icon(Icons.arrow_forward),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
