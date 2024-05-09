import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user_repository.dart';
import 'user_model.dart';
import 'profile_controller.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: CreateEvent(),
  ));
}

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now(); // Added selectedTime

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
              // Update the text controller for the date field
              dateController.text =
              "${newDateTime.year}-${newDateTime.month}-${newDateTime.day}";
            });
          },
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: DateTime(0, selectedTime.hour, selectedTime.minute),
          onDateTimeChanged: (DateTime newDateTime) {
            setState(() {
              selectedTime = TimeOfDay.fromDateTime(newDateTime);
              // Update the text controller for the time field
              timeController.text =
              "${selectedTime.hour}:${selectedTime.minute}";
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
    UserRepository.instance.addEventToUser(userDocumentId, event);
  }

  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventTypeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController dateController = TextEditingController(); // Added date controller
  TextEditingController timeController = TextEditingController(); // Added time controller

  @override
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
              // Event Type Dropdown
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: DropdownButtonFormField(
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
                      child: Text("School Reunion"),
                      value: "School Reunion",
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
              // City / Town TextField
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
              // Postcode TextField
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
              // Date TextField
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: CupertinoTextField(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  readOnly: true,
                  controller: dateController,
                  placeholder: 'Select Date', // Added placeholder text
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CupertinoColors.white,
                    border: Border.all(color: CupertinoColors.systemGrey),
                  ),
                ),
              ),
              // Time TextField
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: CupertinoTextField(
                  onTap: () {
                    _showTimePicker(context);
                  },
                  readOnly: true,
                  controller: timeController,
                  placeholder: 'Select Time', // Added placeholder text
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CupertinoColors.white,
                    border: Border.all(color: CupertinoColors.systemGrey),
                  ),
                ),
              ),
              // Create Event Button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    print("creating started");
                    createEvent();
                    // Navigate back to MyApp after event creation
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MainApp()),
                      // Assuming MainApp is MyApp
                          (Route<dynamic> route) => false,
                    );
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
                    "Create Event",
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
            ],
          ),
        ),
      ),
    );
  }
}
