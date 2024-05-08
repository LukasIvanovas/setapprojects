// import 'package:firebase_database/firebase_database.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// Future<void> openEmailComposer(String userId, String eventId) async {
//   // fetch event details from Firebase
//   final eventRef = FirebaseDatabase.instance.ref('users/$userId/events/$eventId');
//   final eventSnapshot = await eventRef.get();
//
//   if (eventSnapshot.exists) {
//     final eventData = eventSnapshot.value as Map<dynamic, dynamic>?;
//
//     if (eventData != null) {
//       final eventName = eventData['Event Name'] as String?;
//       final eventType = eventData['Event Type'] as String?;
//       final city = eventData['City'] as String?;
//       final postcode = eventData['PostCode'] as String?;
//       final date = eventData['Date'] as String?;
//
//       // create the email body with event details
//       final emailBody =
//           'You are invited to our event:\n\n Event Name: $eventName\nEvent Type: $eventType\n City:\n $city\nPostcode: $postcode\nDate: $date';
//
//       final Uri emailLaunchUri = Uri(
//         scheme: 'mailto',
//         path: '',
//         queryParameters: <String, String>{
//           'subject': 'Invitation',
//           'body': emailBody,
//         },
//       );
//
//       if (await canLaunchUrl(emailLaunchUri)) {
//         await launchUrl(emailLaunchUri);
//       } else {
//         // Handle the case where the email app is not available
//         print('Could not launch email client');
//       }
//     }
//   } else {
//     // Handle the case where the event data is not available
//     print('Event data not found');
//   }
// }
//
// void shareEvent(String userId, String eventId) {
//   // call the openEmailComposer function with the provided userId and eventId
//   openEmailComposer(userId, eventId);
// }