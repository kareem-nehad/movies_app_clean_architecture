
import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_app_clean_architecture/movies/data/source/movie_remote_data_source.dart';
import 'package:movies_app_clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app_clean_architecture/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app_clean_architecture/movies/domain/usecases/get_popular.dart';
import 'package:movies_app_clean_architecture/movies/domain/usecases/get_top_rated.dart';
import 'package:movies_app_clean_architecture/movies/presentation/controller/movies_bloc.dart';

/*
As the app got bigger, many classes began dependant on each other, so to do a simple task,
we are required to create a lot of instances of classes for each task. In addition to being
a bad practice, this will also occupy a large chunk of the memory which will eventually
lead to worse performance.

The package 'GetIt' is used in flutter as a service locator, meaning that is allows
for the creation of an instance once and injecting it anywhere else without the need
to create multiple instances of classes and depending them on each other.

First, a global instance of the service locator is created, and on its initialization,
all the classes needed should be registered as singletons (ensuring that only one instance of the class is created).
Then, whenever an already registered instance is needed, an instance of the service locator should be provided.

It's important to ensure that the services locator class is initialized in the Main.dart
file before the start of the app.
 */

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    
    // Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(baseMovieRemoteDataSource: sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetNowPlaying(sl()));
    sl.registerLazySingleton(() => GetPopular(sl()));
    sl.registerLazySingleton(() => GetTopRated(sl()));

    // Movies BLoC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
  }
}