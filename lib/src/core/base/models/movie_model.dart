import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../init/utils/typedefs.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends INetworkModel {
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  int? id;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "release_date")
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  MovieModel fromJson(JsonMap json) {
    return _$MovieModelFromJson(json);
  }

  @override
  JsonMap? toJson() {
    return _$MovieModelToJson(this);
  }

  factory MovieModel.fromJson(JsonMap json) => _$MovieModelFromJson(json);
}
