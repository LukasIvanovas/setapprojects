import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? ID;
  final String email;
  final String passWord;
  final String question1;
  final String question2;
  final String userName;

  const UserModel({
    this.ID,
    required this.email,
    required this.passWord,
    required this.question1,
    required this.question2,
    required this.userName,
  });

  toJson(){
    return {"email": email, "passWord": passWord, "question1": question1, "question2": question2, "userName": userName};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        ID: document.id,
        email: data["email"],
        passWord: data["passWord"],
        question1: data["question1"],
        question2: data["question2"],
        userName: data["userName"],
    );
  }
}