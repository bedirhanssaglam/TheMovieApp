import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../core/init/utils/typedefs.dart';

part 'base_genres_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseGenresModel<T extends INetworkModel> extends INetworkModel {
  BaseGenresModel({
    this.parseModel,
    this.genres,
  });

  T? parseModel;
  List<T>? genres;

  T fromJsonT(Object? json) {
    return parseModel?.fromJson(json as JsonMap);
  }

  Object? toJsonT(T data) {
    return data.toJson();
  }

  @override
  fromJson(JsonMap json) {
    return _$BaseGenresModelFromJson(json, fromJsonT);
  }

  @override
  JsonMap toJson() {
    return _$BaseGenresModelToJson(this, toJsonT);
  }
}
