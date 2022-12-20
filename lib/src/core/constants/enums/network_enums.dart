enum NetworkEnums {
  genres('genre/movie/list'),
  movieStars('trending/person/week'),
  topRated('movie/top_rated');

  final String endpointName;
  const NetworkEnums(this.endpointName);
}
