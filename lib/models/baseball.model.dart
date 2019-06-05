import 'package:cloud_firestore/cloud_firestore.dart';
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

  BaseballModel.fromSnapshot(DocumentSnapshot snapshot)
      : key = snapshot.documentID,
        name = snapshot['name'],
        coach = snapshot['coach'],
        players = snapshot['players'];
}
