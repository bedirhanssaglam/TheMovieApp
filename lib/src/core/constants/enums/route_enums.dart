enum RouteEnums {
  splash('/splash'),
  home('/home'),
  discover('/discover'),
  topRated('/top-rated'),
  nowPlayingMovies('/now-playing-movies'),
  movieDetails('/movie-details');

  final String routeName;
  const RouteEnums(this.routeName);
}
