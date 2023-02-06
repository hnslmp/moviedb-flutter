import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/model/bloc/genre/genre_cubit.dart';
import 'package:moviedb_flutter/model/bloc/navigation/navigation_cubit.dart';
import 'package:moviedb_flutter/presentation/root_page.dart';
import 'presentation/genre_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GenreCubit(),
            )
          ],
          child: MaterialApp(
            home: RootPage(),
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
