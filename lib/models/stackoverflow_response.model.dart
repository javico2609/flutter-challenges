import 'package:playground_flutter/models/stackoverflow.model.dart';

class StackOverflowResponseModel {
  List<StackOverflowModel> items;
  bool hasMore;

  StackOverflowResponseModel({
    this.items,
    this.hasMore,
  });

  StackOverflowResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<StackOverflowModel>();
      json['items'].forEach((v) {
        items.add(new StackOverflowModel.fromJson(v));
      });
    }
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['has_more'] = this.hasMore;
    return data;
  }
}
