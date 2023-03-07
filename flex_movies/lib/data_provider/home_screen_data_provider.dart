import 'dart:convert';
import 'package:flex_movies/model/movie_model.dart';
import 'package:flex_movies/model/tv_series_model.dart';
import 'package:http/http.dart' as http;

class FetchHomeRepo {
  Future<List<dynamic>> getHomePageMovies() async {
    final url = 'https://moviedb.cyclic.app/api/v1';
    MovieModelList trandingData;
    MovieModelList nowPlayeingData;
    MovieModelList topRatedData;
    MovieModelList upcomingData;
    TvModelList tvshowData;
    TvModelList topRatedTvData;

    final response = await http.get(Uri.parse('$url/home'));
    if (response.statusCode == 200) {
      trandingData =
          MovieModelList.fromJson(json.decode(response.body)['trandingMovies']);
      nowPlayeingData = MovieModelList.fromJson(
          json.decode(response.body)['nowPlayingMovies']);
      topRatedData =
          MovieModelList.fromJson(json.decode(response.body)['topRatedMovies']);
      upcomingData =
          MovieModelList.fromJson(json.decode(response.body)['upcoming']);
      tvshowData =
          TvModelList.fromJson(json.decode(response.body)['trandingtv']);
      topRatedTvData =
          TvModelList.fromJson(json.decode(response.body)['topRatedTv']);
      return [
        trandingData.movies,
        nowPlayeingData.movies,
        topRatedData.movies,
        upcomingData.movies,
        tvshowData.movies,
        topRatedTvData.movies
      ];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
