import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tasklink/views/tasksingle.dart';



Widget suggestioncard(BuildContext context, DocumentSnapshot task) {
String location = task['location'];
  return new Container(
    child: Card(
      child: FlatButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tasksingle(
              name: task['name'],
              category :task['category'],
              cash : task['cash'],
              location : task['location'],
              bio :  task['bio'],
              uid: task['uid'],
              taskuid: task.documentID,
            )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top : 16.0 , bottom: 16),
          child: Column(
            children: <Widget>[


              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(children: <Widget>[
                  AutoSizeText(task['name'].toUpperCase()+" - "+task['category'], style: new TextStyle(fontSize: 14.0, ),),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Text(task['workerrates'], style: TextStyle(fontSize: 18),),
                      Icon(Icons.stars, size: 18, color: Colors.yellow,)
                    ],
                  )
                ]),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Approximate cash : "+task['cash'], style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    ),
  );
}



