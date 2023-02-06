import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: MaterialApp(
        home: RootPage(),
        theme: ThemeData(primarySwatch: Colors.blueGrey),
      ),
    );
  }
}
