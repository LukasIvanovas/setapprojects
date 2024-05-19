import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'profile_controller.dart';
import 'user_model.dart';
import 'package:flutter/cupertino.dart';
import 'user_repository.dart';


class EditEvents extends StatefulWidget {
  const EditEvents({Key? key}) : super(key: key);

  @override
  _EditEventsState createState() => _EditEventsState();
}
class _EditEventsState extends State<EditEvents> {
  Future<List<Widget>> getEvents() async {
    List<Widget> toReturn = [];

    CollectionReference<Map> userDataList = FirebaseFirestore.instance.collection("users").doc(userDocumentId).collection("events");

    // Fetch the documents
    QuerySnapshot<Map> querySnapshot = await userDataList.get();

    // Iterate over each document
    for (var doc in querySnapshot.docs) {
      Map<dynamic, dynamic> data = doc.data();

      // Create a list for this event's details
      List<dynamic> eventDetailList = [
        data['eventName'],
        data['eventType'],
        data['date'],
        data['city'],
        data['postcode'],
        doc.id,
      ];

      // Add this event's details to the list
      toReturn.add(
        Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.5,
            child: SizedBox.expand(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(eventDetails: eventDetailList),
                    ),
                  );
                },
                child: Text(
                  eventDetailList[0],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          )
        )
      );
    }

    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        body: 
          ListView(
            children: [
              
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    "Select an event to edit",
                    style: TextStyle(
                      fontSize: 30,
                    )
                  )
                )
              ),

              FutureBuilder<List<Widget>>(
                future: getEvents(),
                builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show loading spinner while waiting
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}'); // Show error message if any error occurred
                  } else {
                    return Column(children: snapshot.data!); // Display your widgets when data is available
                  }
                },
              )
            ],
          )
      )
    );
  }
}




class EditPage extends StatefulWidget {
  final List<dynamic> eventDetails;

  EditPage({required this.eventDetails});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  

  DateTime selectedDate = DateTime.now();
  late TextEditingController eventNameController = TextEditingController(text: widget.eventDetails[0]);
  late TextEditingController eventTypeController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController postcodeController = TextEditingController();

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectedDate,
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() {
              selectedDate = newDateTime;
            });
          },
        ),
      ),
    );
  }

  void createEvent() async {
    EventModel event = EventModel(
      eventName: eventNameController.text,
      eventType: eventTypeController.text,
      city: cityController.text,
      postcode: postcodeController.text,
      date: selectedDate,
    );



    var eventId = widget.eventDetails[5];

    UserRepository.instance.updateUserEvent(userDocumentId, eventId, event);
  }

  String? dropdownValue;


  @override
  
  void initState() {
    super.initState();
    eventNameController = TextEditingController(text: widget.eventDetails[0]);
    eventTypeController = TextEditingController();
    cityController = TextEditingController(text: widget.eventDetails[3]);
    postcodeController = TextEditingController(text: widget.eventDetails[4]);
    dropdownValue = widget.eventDetails[1];
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: NetworkImage(
                  "https://cdn3.iconfinder.com/data/icons/network-and-communications-6/130/291-128.png",
                ),
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                child: Text(
                  "Planify",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xff3a57e8),
                  ),
                ),
              ),
              Text(
                "Create Event",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: eventNameController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Event Name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: DropdownButtonFormField(
                  value: value: widget.eventDetails[1].isNotEmpty ? widget.eventDetails[1] : null,
                  items: [
                    DropdownMenuItem(
                      child: Text("Birthday Party"),
                      value: "Birthday Party",
                    ),
                    DropdownMenuItem(
                      child: Text("Wedding"),
                      value: "Wedding",
                    ),
                    DropdownMenuItem(
                      child: Text("School Renunion"),
                      value: "School Renunion",
                    ),
                    DropdownMenuItem(
                      child: Text("Holiday"),
                      value: "Holiday",
                    ),

                  ],
                  onChanged: (value) {
                    setState(() {
                      eventTypeController.text = value.toString(); 
                    });
                  },
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Event Type",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: cityController,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "City / Town",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: postcodeController,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                      BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Event Postcode",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: CupertinoTextField(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  readOnly: true,
                  controller:
                  TextEditingController(text: "${selectedDate.toLocal()}".split(' ')[0]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CupertinoColors.white,
                    border: Border.all(color: CupertinoColors.systemGrey),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 30, 0),
                    child: MaterialButton(
                      onPressed: () {
                        // dispose();
                        Navigator.pop(context);
                      },
                      color: Color(0xff3a57e8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Color(0xff9e9e9e),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 40,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: MaterialButton(
                      onPressed: () {
                        print("creating started");
                        createEvent();
                        // dispose();
                        Navigator.of(context).pop();
                        print("creating finished");
                      },
                      color: Color(0xff3a57e8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Color(0xff9e9e9e),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Edit Event",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 40,
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
