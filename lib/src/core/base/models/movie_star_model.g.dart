// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_star_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieStarModel _$MovieStarModelFromJson(Map<String, dynamic> json) =>
    MovieStarModel(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      mediaType: json['media_type'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      gender: json['gender'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$MovieStarModelToJson(MovieStarModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'media_type': instance.mediaType,
      'popularity': instance.popularity,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
    };
