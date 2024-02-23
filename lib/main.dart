import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';


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


List<event> eventList = [event1, event2, event3, event4] ;

void main() {
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

      String eventText = "Event: ${eventList[i].name} \n Location: ${eventList[i].location} \n Date: ${eventList[i].date}";
      widgetList1.add(
        
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.029),

          child: SizedBox (
            width: MediaQuery.of(context).size.width * 0.26,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SizedBox.expand(
              child: ElevatedButton(
                onPressed: (){},

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue.shade300),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )
                  )
                ),

                child: Text(
                  eventText,
                  style: const TextStyle(fontSize: 22)
                  ),
              )
            )
          )
        ),
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

        appBar: AppBar(
          backgroundColor: Colors.grey,
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        //code to add new event
                      },
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
