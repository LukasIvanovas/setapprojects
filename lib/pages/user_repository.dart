import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user_model.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    print("started adding into DB");
    _db.collection("users").add(user.toJson());
    print("added into db");
  }

  Future<UserModel> retrieveUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> getUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    final userDataList = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userDataList;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> addEventToUser(String userId, EventModel event) async {
    print("add event to user started");
    await _db.collection("users").doc(userId).collection("events").add(event.toJson());
    print("add event to user finished");
  }

  Future<void> updateUserEvent(String userId, String eventId, EventModel event) async {
    print("updating event");
    _db.collection("users").doc(userId).collection("events").doc(eventId).update(event.toJson());
    print("event updated");
  
  }

  Future<String> getDocumentIdByEmail(String email) async {
    print(email);
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      print(snapshot.docs.first.id);
      return snapshot.docs.first.id;
    }
     return 'error';
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("users").doc(user.id).update(user.toJson());
  }

  Future<void> updatePassword(UserModel user, String newPassword) async {
    await _db.collection("users").doc(user.id).update({
      'passWord': newPassword,
    });
  }
  
}




