
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasklink/views/rate.dart';



Widget requestmadecard(BuildContext context, DocumentSnapshot request) {
  DateTime selectedDate = DateTime.now();
  String appointmentdate= DateFormat('dd/MM/yyyy').format(selectedDate).toString();


  return new Container(
    child: Card(
      child: FlatButton(
        onPressed: (){

        },
        child: Padding(
          padding: const EdgeInsets.only(top : 16.0 , bottom: 16),
          child: Column(
            children: <Widget>[
              request["status"] == "Accepted" ?
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 0.0),
                child: Text(
                  request['workername'].toUpperCase(),
                  style:TextStyle(fontSize: 15 , fontWeight: FontWeight.w600, color: Colors.green) ,),
              ): Text(" ", style: TextStyle(fontSize: 1),),

              request["status"] == "Pending" || request["status"] == "Notavailable"  ?
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 0.0),
                child: Text(
                    request['workername'].toUpperCase(),
                  style:TextStyle(fontSize: 15 , fontWeight: FontWeight.w600, color: Colors.red) ,),
              ): Text(" ", style: TextStyle(fontSize: 1),),






              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 1.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "On : " + request['appointmentdate'] + " , " + request['appointmenttime'],
                      style:TextStyle(fontSize: 15 , fontWeight: FontWeight.w400) ,),
                  ],
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("About : " + request['taskcategory'], style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Approximate "+request['cash']+" in shillings", style: new TextStyle(fontSize: 15.0 , fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              request["status"] == "Accepted" ?
                  Column(
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Status : " + request["status"], style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400 ,color: Colors.green),),
                      ],
                    ),
                      Row(
                        children: <Widget>[ Container(
                            width: 250,
                            child: Text("(I would call you upon reaching street area)" , style: TextStyle(fontSize: 13),))],
                      )
                    ],
                  )
                  : Text(" ", style: TextStyle(fontSize: 1),),

              request['status'] == "Notavailable" ?
             Padding(
               padding: const EdgeInsets.only(top: 0.0),
               child: Column(
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Text("Status : " + request["status"], style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.red),) ],
                   ),
                  Row(
                    children: <Widget>[ Container(
                        width: 250,
                        child: Text("(Sorry i would not be available try other people)" , style: TextStyle(fontSize: 13),))],
                  )
                 ],
               ),
             ): Text(" ", style: TextStyle(fontSize: 1),),

              request["status"] == "Pending" ?
             Column(
               children: <Widget>[
                 Column(
                   children: <Widget>[
                     Row(
                       children: <Widget>[
                         Text("Status : " + request["status"], style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.red),) ],
                     ),
                     Row(
                       children: <Widget>[ Container(
                           width: 250,
                           child: Text("(Waiting for a reply)" , style: TextStyle(fontSize: 13),))],
                     ),
                     FlatButton(
                       color: Colors.red,
                       child: Text("Cancel Appointment" , style: TextStyle(color: Colors.white),),
                       onPressed: (){
                         return showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return AlertDialog(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 title: Text("Cancel the appointment ?", style: TextStyle(fontSize: 17),),
                                 actions: <Widget>[
                                   FlatButton(
                                     child: Text('Cancel' , style: TextStyle(color: Colors.black),),
                                     onPressed: (){
                                       Navigator.of(context).pop();
                                     },
                                   ),
                                   FlatButton(
                                     child: Text('OK',  style: TextStyle(color: Colors.black)),
                                     onPressed: (){
                                       delete(context, request.documentID);
                                       Navigator.of(context).pop();
                                       successfullyDeleted(context, request['workername']);
                                     },
                                   )
                                 ],
                               );
                             });
                       },
                     )
                   ],
                 )

               ],
             ): Text(" ", style: TextStyle(fontSize: 1),),

              request['appointmentdate'] == appointmentdate &&  request["status"] == "Accepted" ?
                  FlatButton(
                    color: Colors.yellow,
                    child: Text("Rate"),
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Rate(
                        workername : request['workername'],
                        workeruid :request['workeruid'],
                        taskcategory : request['taskcategory'],
                        clientuid : request['clientuid'],
                        appointmentdate :  request['appointmentdate'],
                        appointmenttime: request['appointmenttime'],
                        requestedtaskdocumentid : request.documentID,
                        bio : request['bio'],
                        cash : request['cash'],
                        location: request['workerlocation'],
                        taskuid: request['taskuid']
                      )),);
                    },
                  ) : Text(" ", style: TextStyle(fontSize: 1),),

            ],
          ),
        ),
      ),
    ),
  );
}

Future delete(context , requestid) async{
  String documentId = requestid;
  Firestore.instance.collection('requestedTasks').document(documentId).delete();
}
Future successfullyDeleted(context, workername){
  String name = workername;
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Canceled", style: TextStyle(color: Colors.red),),
          content: Text("Appointment with " + name.toUpperCase() + " is canceled" , style: TextStyle(fontSize: 13),),
        );
      }
  );
}



