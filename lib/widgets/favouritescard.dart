import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tasklink/views/tasksingle.dart';



Widget favouritescard(BuildContext context, DocumentSnapshot task) {
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
              taskuid: task['taskuid'],
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
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: (){
                      return showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: Text("Delete from favourites ?", style: TextStyle(fontSize: 17),),
                              content: Text('This will remove it from your list',style: TextStyle(fontSize: 14),),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cancel', style: TextStyle(color: Colors.black),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('OK', style: TextStyle(color: Colors.black)),
                                  onPressed: (){
                                    delete(context, task.documentID);
                                    Navigator.of(context).pop();
                                    successfullyDeleted(context, task['name']);
                                  },
                                )
                              ],
                            );
                          });

                    },
                  ),
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
Future delete(context , taskid) async{
  String documentId = taskid;
  Firestore.instance.collection('favourites').document(documentId).delete();
}

Future successfullyDeleted(context, task){
  String name = task;
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text("Deleted", style: TextStyle(color: Colors.red),),
          content: Text( name.toUpperCase() + " is deleted from favourites" , style: TextStyle(fontSize: 13),),
        );
      }
  );
}



