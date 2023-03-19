import 'package:movies_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_app_clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetPopular {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopular(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}