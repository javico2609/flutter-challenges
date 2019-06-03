// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseball.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseballModel _$BaseballModelFromJson(Map<String, dynamic> json) {
  return BaseballModel(
      key: json['key'],
      name: json['name'] as String,
      coach: json['coach'] as String,
      players: json['players'] as int);
}

Map<String, dynamic> _$BaseballModelToJson(BaseballModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'coach': instance.coach,
      'players': instance.players
    };
