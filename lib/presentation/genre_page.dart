import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/model/bloc/genre/genre_cubit.dart';
import 'package:moviedb_flutter/presentation/movielist_page.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    GenreCubit cubitGenre = context.read<GenreCubit>();
    cubitGenre.fetchGenres();

    return BlocBuilder<GenreCubit, GenreState>(
      bloc: cubitGenre,
      builder: (context, state) {
        return Visibility(
          visible: state.isLoaded,
          child: ListView.builder(
              itemCount: state.genres.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.genres[index].name),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieListPage(selectedGenre: state.genres[index]),
                      ),
                    );
                  },
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
