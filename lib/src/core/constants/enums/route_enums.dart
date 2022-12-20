enum RouteEnums {
  splash('/splash'),
  intro('/intro'),
  home('/home'),
  discover('/discover'),
  topRated('/top-rated'),
  nowPlayingMovies('/now-playing-movies'),
  searchedMovies('/searched-movies/:searchWord'),
  movieDetails('/movie-details/:id');

  final String routeName;
  const RouteEnums(this.routeName);
}
