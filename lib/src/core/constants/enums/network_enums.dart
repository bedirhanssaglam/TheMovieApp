enum NetworkEnums {
  genres('genre/movie/list'),
  movieStars('trending/person/week'),
  topRated('movie/top_rated'),
  nowPlaying('movie/now_playing'),
  discover('discover/movie'),
  movieDetails('movie/'),
  searchMovie('search/movie');

  final String endpointName;
  const NetworkEnums(this.endpointName);
}
