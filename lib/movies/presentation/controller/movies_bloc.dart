import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/utils/enums.dart';
import 'package:movies_app_clean_architecture/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app_clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:movies_app_clean_architecture/movies/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_popular.dart';
import '../../domain/usecases/get_top_rated.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlaying getNowPlayingUseCase;
  final GetPopular getPopularUseCase;
  final GetTopRated getTopRatedUseCase;

  MoviesBloc(this.getNowPlayingUseCase, this.getPopularUseCase,
      this.getTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase.execute();
    result.fold(
            (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCase.execute();
    result.fold(
            (l) => emit(state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        )));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase.execute();
    result.fold(
            (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        )));
  }
}
