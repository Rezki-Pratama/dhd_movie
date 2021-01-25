part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
  
  @override
  List<Object> get props => [];
}

class MovieListStateEmpty extends MovieListState {}

class MovieListStateLoading extends MovieListState {}

class MovieListStateSuccess extends MovieListState {
  final List<MovieListModel> movieList;

  MovieListStateSuccess({ this.movieList});

  MovieListStateSuccess copyWith({List<MovieListModel> user}){
    return MovieListStateSuccess(
      movieList: user ?? this.movieList,
    );
  }
}
