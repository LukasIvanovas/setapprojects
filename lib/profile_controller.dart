import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());
  Future<List<UserModel>> getUserData(String email) async {
    List<UserModel> userDataList = await _userRepo.getUserDetails(email);
    return userDataList;
  }
}