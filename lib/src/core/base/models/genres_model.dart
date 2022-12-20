import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/init/utils/typedefs.dart';

part 'genres_model.g.dart';

@JsonSerializable()
class GenresModel extends INetworkModel<GenresModel> {
  int? id;
  String? name;

  GenresModel({
    this.id,
    this.name,
  });

  @override
  GenresModel fromJson(JsonMap json) => GenresModel.fromJson(json);

  factory GenresModel.fromJson(JsonMap json) => _$GenresModelFromJson(json);

  @override
  JsonMap? toJson() => _$GenresModelToJson(this);
}
