enum RouteEnums {
  splash('/splash'),
  home('/home'),
  discover('/discover'),
  topRated('/top-rated'),
  nowPlayingMovies('/now-playing-movies');

  final String routeName;
  const RouteEnums(this.routeName);
}
