enum NetworkEnums {
  genres('genre/movie/list'),
  movieStars('trending/person/week');

  final String endpointName;
  const NetworkEnums(this.endpointName);
}
