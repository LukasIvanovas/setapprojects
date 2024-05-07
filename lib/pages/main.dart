 // flutter run -d chrome
import 'signup.dart';
import 'login.dart';
import 'createEvent.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// example event class and events just for showing what it looks like
class event {
  late String name;
  late String date;
  late String location;

  event (this.name, this.date, this.location){}
}

event event1 = event("Event 1", "19/12/2003", "Swindon");
event event2 = event("Event 2", "03/02/2024", "Portsmouth");
event event3 = event("Event 3", "12/09/2028", "Maldives");
event event4 = event("Event 4", "02/01/2000", "Maldives");


Color GlobBackgroundColor = Colors.lightBlue.shade50;
Color GlobButtonColor = Colors.indigoAccent;
Color GlobColor1 = Colors.deepPurple.shade900;


List<event> eventList = [event1, event2, event3, event4] ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCKiaqMqfbIQDU01955JdYViVCyrNku3Qo", 
      appId: "1:1093883717402:web:abb7af20c185cc6b19aea3",
      messagingSenderId: "1093883717402", 
      projectId: "setapcoursework",
    ),
  );
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  List<Widget> getEvents (context) {
    //returns all events in rows of 3

    List<Widget> widgetList1 = [];
    List<List<Widget>> widgetList2 = [];
    List<Widget> rowList = [];

    for (int i = 0; i < eventList.length; i++) {
      
      if (widgetList1.length == 3) {
        widgetList2.add(widgetList1);
        widgetList1 = [];
      } 

      String eventText = "Location: ${eventList[i].location}\nDate: ${eventList[i].date}";
      widgetList1.add(
        
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.024),

          child: SizedBox (
            
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SizedBox.expand(

              child: Material(
                elevation: 10,
              
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.indigoAccent, width: 1),
                    color: Colors.indigo.shade200,
                  ),

                  child: Column(

                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, (MediaQuery.of(context).size.width * 0.02), 0.0, (MediaQuery.of(context).size.width * 0.06)),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            eventList[i].name,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            )
                          )
                        )
                      ),
                      
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          eventText,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white
                          )
                        )
                      ),

                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.settings, size: 40, color: Colors.black),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.info_outline, size: 40, color: Colors.black),
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              )
            )
          ),
        )
      );   
    }

    if (widgetList1.isNotEmpty) {
      widgetList2.add(widgetList1);
    }
    
    for (int i = 0; i < widgetList2.length; i++) {
      rowList.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widgetList2[i],
        )  
      );
    }

    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GlobBackgroundColor,

        appBar: AppBar(
          backgroundColor: GlobColor1,
          leading: GestureDetector(
            onTap: () {

              // naya - add nav bar code here 

            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: [

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15), 
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.indigoAccent, width: 1),
                    color: Colors.indigo.shade200
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SizedBox.expand(

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateEvent()),
                          );
                        },
                        style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)))),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Add event",
                            style: TextStyle(
                              fontSize: 25,
                            )
                          )
                        )
                      )
                    )
                  )
                )
              ),
            ),

            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Your events",
                  style: TextStyle(
                    fontSize: 35,
                    decoration: TextDecoration.underline,
                  )
                ),
              )
            ),



            SingleChildScrollView(
              child: 
              Column(
                children: getEvents(context)),
              ),
            
          ]
        ),
      ),
    );
  }
}

