import 'package:movies_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_app_clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetNowPlaying{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlaying(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}