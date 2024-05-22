import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/login.dart';
import '../lib/pages/navBar.dart';
import 'package:flutter/rendering.dart';
// tests for the homepage

//test 1

void test1 () {
  testWidgets("Testing login with valid credentials", (WidgetTester tester) async{
    // debugDumpApp();

    await tester.pumpWidget(MyApp());

    print(tester.takeException());

    await tester.enterText(find.byKey(ValueKey("emailKey")), 'test@test.com');
    await tester.enterText(find.byKey(ValueKey(('passwordKey'))), 'test');


    // Tap the login button and trigger a frame
    await tester.tap(find.byKey(Key('loginKey')));
    await tester.pumpAndSettle();

    // Check that the LoginPage is no longer in the widget tree
    expect(find.byWidget(MyApp()), findsNothing);

    // Check that the DashboardPage is now in the widget tree
    expect(find.byWidget(HomePage()), findsOneWidget);


  });

}

// test 2

void test2 () {
  testWidgets("Testing to see if there is an error message popup if incorrect credentials", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    
    // Enter invalid login credentials
    await tester.enterText(find.byKey(Key('emailKey')), 'invalid@invalid.com');
    await tester.enterText(find.byKey(Key('passwordKey')), 'invalidPassword');

    // Tap the login button and trigger a frame
    await tester.tap(find.byKey(Key('loginKey')));
    await tester.pump();

    // Check that an error message is displayed
    expect(find.text('Login failed! Username or password incorrect'), findsOneWidget);

  });

}


void login_tests () {
  test1();
  
}

void main() {
  login_tests();
}


