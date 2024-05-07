import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // fucntion to initialise notifications
  Future<void> initNotifications() async {
    // request permission from user(will promt user)
    await _firebaseMessaging.requestPermission();

    // fetch the fmc token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    //print the token (normaly sent to server)
    print('Token: $fCMToken');
  }
}
