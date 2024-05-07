import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    _db.collection("users").add(user.toJson());
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

}