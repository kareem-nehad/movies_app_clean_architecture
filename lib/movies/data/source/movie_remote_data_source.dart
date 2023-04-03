import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture/core/error/exception.dart';
import 'package:movies_app_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_app_clean_architecture/core/utils/constants.dart';
import 'package:movies_app_clean_architecture/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRated();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        '${AppConstants.baseUrl}${AppConstants.nowPlayingMoviesEndPoint}?api_key=${AppConstants.apiKey}');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      /*
      In the case of an error in the server, a custom exception was made and thrown
      as we could not return a null or an empty list according to the best practices,
      this is due to the return type of the method (Future<List>).
       */
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get('${AppConstants.baseUrl}${AppConstants.popularMoviesEndPoint}?api_key=${AppConstants.apiKey}');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await Dio().get('${AppConstants.baseUrl}${AppConstants.topRatedMoviesEndPoint}?api_key=${AppConstants.apiKey}');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
