import 'package:json_annotation/json_annotation.dart';

part 'baseball.model.g.dart';

@JsonSerializable()
class BaseballModel {
  dynamic key;
  String name;
  String coach;
  int players;

  BaseballModel({
    this.key,
    this.name = "",
    this.coach = "",
    this.players = 0,
  });

  factory BaseballModel.fromJson(Map<String, dynamic> json) =>
      _$BaseballModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseballModelToJson(this);
}
