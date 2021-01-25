import 'package:dhd_movie/presentation/bloc/movie_list_bloc.dart';
import 'package:dhd_movie/presentation/movie_detail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DHD Movie'),
      ),
      body: Container(
        margin: EdgeInsets.all(size.width * 0.02),
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListStateEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              MovieListStateSuccess movieListStateSuccess =
                  state as MovieListStateSuccess;
              return ListView.builder(
                itemCount: movieListStateSuccess.movieList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieDetail(movieListModel: movieListStateSuccess.movieList[index],)),
                        );
                      },
                      child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.02),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.15,
                                  child: ExtendedImage.network(
                                    "https://image.tmdb.org/t/p/w200/" +
                                        movieListStateSuccess
                                            .movieList[index].posterPath,
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                    fit: BoxFit.fill,
                                    cache: true,
                                    border: Border.all(
                                        color: Colors.red, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    //cancelToken: cancellationToken,
                                  )),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieListStateSuccess
                                          .movieList[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                    Text(
                                      movieListStateSuccess
                                          .movieList[index].voteAverage
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
