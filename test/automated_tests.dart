import 'dart:convert';
import '../lib/pages/login.dart';
import '../lib/pages/navBar.dart';
import 'package:flutter/rendering.dart';
import "../lib/pages/user_model.dart";
import "../lib/pages/signup.dart";
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService({required this.firestore});

  Future<void> addUser(UserModel user) async {
    await firestore.collection('users').add(user.toJson());
  }
}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockFirebaseCore extends Mock implements Firebase {
  @override
  Future<FirebaseApp> initializeApp({FirebaseOptions? options, String? name}) async {
    return MockFirebaseApp();
  }
}

void test1() {
  testWidgets("Testing login with valid credentials", (WidgetTester tester) async {
    // Create an instance of MockFirebaseCore
    final mockFirebaseCore = MockFirebaseCore();

    // Initialize the mock FirebaseApp
    final firebaseApp = await mockFirebaseCore.initializeApp();

    // Create the FakeFirebaseFirestore
    final fakeFirestore = FakeFirebaseFirestore();
    final firestoreService = FirestoreService(firestore: fakeFirestore);

    var toAdd = UserModel(
      email: "auto_test@test.com",
      passWord: "test",
      question1: "aaaaaaaaaaaa",
      question2: "aaaaaaaaaaaa",
      userName: "auto_test",
    );

    await firestoreService.addUser(toAdd); // Call the instance method

    await tester.pumpWidget(MaterialApp(
      home: Login(fb: fakeFirestore),
    ));

    print(tester.takeException());
    await tester.enterText(find.byKey(ValueKey("emailKey")), 'auto_test@test.com');
    await tester.enterText(find.byKey(ValueKey('passwordKey')), 'test');
    await tester.tap(find.byKey(Key('loginKey')));
    await tester.pump();
    expect(find.byType(Login), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);
  }, timeout: Timeout(Duration(seconds: 10)));
}



void test2 () {
  testWidgets("Testing to see if there is an error message popup if incorrect credentials", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    
    // Enter invalid login credentials
    await tester.enterText(find.byKey(ValueKey('emailKey')), 'invalid@invalid.com');
    await tester.enterText(find.byKey(ValueKey('passwordKey')), 'invalidPassword');

    // Tap the login button and trigger a frame
    await tester.tap(find.byKey(ValueKey('loginKey')));
    await tester.pump();

    // Check that an error message is displayed
    expect(find.text('Login failed! Username or password incorrect'), findsOneWidget);

  });

}

void test3() async {

  testWidgets("Testing to see if the signup button works", (WidgetTester tester) async {
    // WidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(Login());

    await tester.tap(find.byKey(ValueKey("signupButton")));

    await tester.pump();
    expect(find.byWidget(MyApp()), findsNothing);
  });
}

void login_tests () {
  test3();
  
}


// signup test
void test4() {
  //had to create keys for all widgets
  testWidgets("testing signup page with valid details", (WidgetTester tester) async {
    await tester.pumpWidget(SignUp());

    await tester.enterText(find.byKey(ValueKey("nameField")), "test111");
    await tester.enterText(find.byKey(ValueKey("emailField")), "auto_test@test.com");
    await tester.enterText(find.byKey(ValueKey("passField")), "test_auto");
    await tester.enterText(find.byKey(ValueKey("pass2Field")), "test_auto");
    await tester.enterText(find.byKey(ValueKey("s1Field")), "testtest");
    await tester.enterText(find.byKey(ValueKey("s2Field")), "testtest");

    await tester.tap(find.byKey(ValueKey("buttonField")));

    expect(find.text("Account created successfully!"), findsOneWidget);

  });

}





void main() {


  test1();
}

