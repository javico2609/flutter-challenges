import 'package:playground_flutter/models/stackoverflow_response.model.dart';
import 'package:playground_flutter/services/web.client.dart';

class StackOverflowService {
  Future<StackOverflowResponseModel> list([int page = 1]) async {
    var query = {
      'order': 'desc',
      'sort': 'activity',
      'site': 'stackoverflow',
      'page': page,
      'pagesize': 5,
    };

    var response = await http.get('', query);

    return StackOverflowResponseModel.fromJson(response);
  }
}
