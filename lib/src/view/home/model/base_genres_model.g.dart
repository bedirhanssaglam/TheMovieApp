// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseGenresModel<T> _$BaseGenresModelFromJson<T extends INetworkModel<dynamic>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseGenresModel<T>(
      parseModel: _$nullableGenericFromJson(json['parseModel'], fromJsonT),
      genres: (json['genres'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BaseGenresModelToJson<T extends INetworkModel<dynamic>>(
  BaseGenresModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'parseModel': _$nullableGenericToJson(instance.parseModel, toJsonT),
      'genres': instance.genres?.map(toJsonT).toList(),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
