import 'package:playground_flutter/constants/database.dart';
import 'package:playground_flutter/models/baseball.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBaseballService {
  Firestore _db = Firestore.instance;

  // subscribe in real time
  Stream<List<BaseballModel>> list() => _db
      .collection(DatabaseContants.TEAMS_TABLE_NAME)
      .snapshots()
      .map((QuerySnapshot q) => q.documents
          .map((DocumentSnapshot d) => BaseballModel.fromSnapshot(d))
          .toList());

  Future<bool> delete(BaseballModel item) async {
    try {
      await _db
          .collection(DatabaseContants.TEAMS_TABLE_NAME)
          .document(item.key)
          .delete();
      return true;
    } catch (e) {
      return await Future.value(false);
    }
  }

  Future<bool> create(BaseballModel item) async {
    try {
      await _db
          .collection(DatabaseContants.TEAMS_TABLE_NAME)
          .add(item.toJson());
      return true;
    } catch (e) {
      return await Future.value(false);
    }
  }

  Future<bool> update(BaseballModel item) async {
    try {
      final DocumentSnapshot document = await _db
          .collection(DatabaseContants.TEAMS_TABLE_NAME)
          .document(item.key)
          .snapshots()
          .first;

      Map<String, dynamic> dataToUpdate = item.toJson();
      //remove key or id entity from my json map
      dataToUpdate.remove('key');

      await document.reference.updateData(dataToUpdate);

      return true;
    } catch (e) {
      return await Future.value(false);
    }
  }
}
