import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasklink/views/tasksingle.dart';

import 'package:tasklink/widgets/provider_widget.dart';


Widget buildCard(BuildContext context, DocumentSnapshot task) {
  String imagename;
  String location = task['location'];

if(task["category"] == "cooking"){
  imagename = "assets/images/chef.jpg";
}else if (task["category"] == "electrician"){
  imagename = "assets/images/worker.png";
}else if(task["category"] == "plumbing"){
  imagename = "assets/images/plumber.png";
}else if(task["category"] == "laundry"){
  imagename = "assets/images/laundry.png";
}else if(task["category"] == "shopping"){
  imagename = "assets/images/shoping.png";
}else if(task["category"] == "gardening"){
  imagename = "assets/images/gardening.png";
}else if(task["category"] == "delivery"){
  imagename = "assets/images/delivery.png";
}else if(task["category"] == "cleaning"){
  imagename = "assets/images/clineaning.jpg";
}else if(task["category"] == "driving"){
  imagename = "assets/images/driving.png";
}else if(task["category"] == "home repairs"){
  imagename = "assets/images/homerepaires.png";
}else if(task["category"] == "line booking"){
  imagename = "assets/images/line.png";
}else if(task["category"] == "luggage carrier"){
  imagename = "assets/images/laguage.png";
}else if(task["category"] == "messenger"){
  imagename = "assets/images/message.png";
}


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
              taskuid : task.documentID
            )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top : 16.0 , bottom: 16),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                child: Row(children: <Widget>[
                  Text(
                    task['category'].toUpperCase(),
                    style:TextStyle(fontSize: 16 , fontWeight: FontWeight.w600, color: Colors.lightGreen) ,),
                  Spacer(),

                 Row(
                    children: <Widget>[
                          Text(task['workerrates'], style: TextStyle(fontSize: 18),),
                      Icon(Icons.stars, size: 18 , color: Colors.yellow,)
                    ],
                 )

                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                child: Container(
                  child: Image.asset(imagename, width: 50,),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Row(children: <Widget>[
                  AutoSizeText(task['name'].toUpperCase(), style: new TextStyle(fontSize: 15.0, ),),
                  Spacer(),

                ]),
              ),



              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Approximate "+task['cash']+" in shillings", style: new TextStyle(fontSize: 13.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 250,
                        child: Visibility(
                          visible: false,
                          child: Text(task['bio'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                          ),
                        )),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    ),
  );
}



