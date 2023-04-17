class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '7c6461abd639a001e8af7ede73ab1b52';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';

  // End-Points
  static const String nowPlayingMoviesEndPoint = '/movie/now_playing';
  static const String popularMoviesEndPoint = '/movie/popular';
  static const String topRatedMoviesEndPoint = '/movie/top_rated';
}