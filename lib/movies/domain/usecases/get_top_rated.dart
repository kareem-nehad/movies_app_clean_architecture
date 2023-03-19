import 'package:movies_app_clean_architecture/movies/domain/entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRated {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRated(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}