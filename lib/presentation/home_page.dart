import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/model/bloc/trending/trending_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingCubit(),
        ),
      ],
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 55),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Most Popular",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: state.trendingMovies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          movie.posterUrl(),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 200,
                              width: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          );
        },
      ),
    );
  }
}
