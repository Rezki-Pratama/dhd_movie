import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dhd_movie/model/movie_list_model.dart';
import 'package:dhd_movie/repositories/movie_list_repo.dart';
import 'package:equatable/equatable.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  List<MovieListModel> movieList;
  MovieListBloc() : super(MovieListStateEmpty());

  @override
  Stream<MovieListState> mapEventToState(
    MovieListEvent event,
  ) async* {
     if(state is MovieListStateEmpty) {
       movieList = await MovieListRepositories.getMovieList();
       yield MovieListStateSuccess(movieList: movieList);
     }
  }
}
