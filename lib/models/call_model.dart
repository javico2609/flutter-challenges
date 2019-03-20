enum CallType { Call, Video }

class CallModel {
  final String name;
  final String time;
  final String avatar;
  final CallType type;

  CallModel({this.name, this.type, this.time, this.avatar});
}
