import 'package:dhd_movie/model/movie_list_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final MovieListModel _movieListModel;

  MovieDetail({@required MovieListModel movieListModel})
      : assert(movieListModel != null),
        _movieListModel = movieListModel;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  MovieListModel get _movieListModel => widget._movieListModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: size.width * 0.30,
                  height: size.width * 0.30,
                  child: ExtendedImage.network(
                    "https://image.tmdb.org/t/p/w200/" + _movieListModel.posterPath,
                    width: 50,
                    height: 50,
                    shape: BoxShape.circle,
                    fit: BoxFit.fill,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    //cancelToken: cancellationToken,
                  )),
              Text(_movieListModel.title),
              Text(_movieListModel.voteAverage.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
