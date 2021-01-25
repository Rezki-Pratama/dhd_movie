import 'package:dhd_movie/presentation/bloc/movie_list_bloc.dart';
import 'package:dhd_movie/presentation/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => MovieListBloc()..add(MovieListFetched()),
        child: MovieList(),
      ),
    );
  }
}
