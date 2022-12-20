// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../init/utils/typedefs.dart';

part 'movie_star_model.g.dart';

@JsonSerializable()
class MovieStarModel extends INetworkModel {
  bool? adult;
  int? id;
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "media_type")
  String? mediaType;
  double? popularity;
  int? gender;
  @JsonKey(name: "known_for_department")
  String? knownForDepartment;
  @JsonKey(name: "profile_path")
  String? profilePath;

  MovieStarModel({
    this.adult,
    this.id,
    this.name,
    this.originalName,
    this.mediaType,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
  });

  @override
  MovieStarModel fromJson(JsonMap json) {
    return _$MovieStarModelFromJson(json);
  }

  @override
  JsonMap? toJson() {
    return _$MovieStarModelToJson(this);
  }

  factory MovieStarModel.fromJson(JsonMap json) =>
      _$MovieStarModelFromJson(json);
}
