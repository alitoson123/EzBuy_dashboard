import 'package:cloud_firestore/cloud_firestore.dart';

class ArudData {
  Future<void> addData({
    required String documentName,
    required Map<String, dynamic> data,
  }) async {
    var user = FirebaseFirestore.instance.collection(documentName);
    user.add(data);
  }

  Future<Map<String, dynamic>> getData(
      {required String documentName, required String useruid}) async {
    var user = await FirebaseFirestore.instance
        .collection(documentName)
        .doc(useruid)
        .get();

    return user.data() as Map<String, dynamic>;
  }

  Future<void> deleteUser(
      {required String documentName, required String useruid}) async {
    await FirebaseFirestore.instance
        .collection(documentName)
        .doc(useruid)
        .delete();
  }

  Future<bool> CheckIsUserAddDataBefore(
      {required String documentName, required String useruid}) async {
    var user = await FirebaseFirestore.instance
        .collection(documentName)
        .doc(useruid)
        .get();

    return user.exists;
  }
}
