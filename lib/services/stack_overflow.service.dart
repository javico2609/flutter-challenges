import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/services/web.client.dart';

class StackOverflowService {
  Future<List<StackOverflowModel>> list() async {
    List<StackOverflowModel> items = [];
    var result = await http.get('');
    List<dynamic> data = result['items'];

    data.forEach((q) {
      items.add(StackOverflowModel.fromJson(q));
    });
    return items;
  }
}
