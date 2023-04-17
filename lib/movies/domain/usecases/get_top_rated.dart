import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/movies/domain/entities/movie.dart';
import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';

class GetTopRated {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRated(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getTopRateMovies();
  }
}