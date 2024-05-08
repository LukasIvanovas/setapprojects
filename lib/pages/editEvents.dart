import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'profile_controller.dart';
import 'user_model.dart';






class EditEvents extends StatelessWidget {
  const EditEvents({super.key});
  

  List<Widget> getEvents (context) {
    List<Widget> toReturn = [];

    CollectionReference<Map> userDataList = FirebaseFirestore.instance.collection("users").doc(userDocumentId).collection("events");
    

    // for (int i = 0; i< length(userDataList); i++) {}

    




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
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Select an event to edit",
                    style: TextStyle(
                      fontSize: 20,
                    )

                  )
                )
              ),

              Column(
                children: getEvents(context),
              )
            ],
          )
      )
    );
  
  }
}
