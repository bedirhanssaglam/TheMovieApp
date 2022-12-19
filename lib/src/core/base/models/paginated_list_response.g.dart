// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedListResponse<T>
    _$PaginatedListResponseFromJson<T extends INetworkModel<dynamic>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        PaginatedListResponse<T>(
          parseModel: _$nullableGenericFromJson(json['parseModel'], fromJsonT),
          page: json['page'] as int?,
          results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
        )
          ..totalPages = json['total_pages'] as int?
          ..totalResults = json['total_results'] as int?;

Map<String, dynamic>
    _$PaginatedListResponseToJson<T extends INetworkModel<dynamic>>(
  PaginatedListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
        <String, dynamic>{
          'parseModel': _$nullableGenericToJson(instance.parseModel, toJsonT),
          'total_pages': instance.totalPages,
          'total_results': instance.totalResults,
          'page': instance.page,
          'results': instance.results?.map(toJsonT).toList(),
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
