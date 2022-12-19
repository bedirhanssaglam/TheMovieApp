import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie/src/core/init/utils/typedefs.dart';
import 'package:vexana/vexana.dart';

part 'paginated_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedListResponse<T extends INetworkModel> extends INetworkModel {
  PaginatedListResponse({
    this.parseModel,
    this.page,
    this.results,
  });

  T? parseModel;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;
  int? page;
  List<T>? results;

  T fromJsonT(Object? json) {
    return parseModel?.fromJson(json as JsonMap);
  }

  Object? toJsonT(T data) {
    return data.toJson();
  }

  @override
  fromJson(JsonMap json) {
    return _$PaginatedListResponseFromJson(json, fromJsonT);
  }

  @override
  JsonMap toJson() {
    return _$PaginatedListResponseToJson(this, toJsonT);
  }
}
