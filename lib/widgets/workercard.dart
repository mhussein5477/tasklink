
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';



Widget workercard(BuildContext context, DocumentSnapshot task) {
  String imagename;

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
                    style:TextStyle(fontSize: 17 , fontWeight: FontWeight.w600, color: Colors.lightGreen) ,),
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
                              title: Text("Delete the task ?", style: TextStyle(fontSize: 17),),
                              content: Text('This will remove it from your list',style: TextStyle(fontSize: 14),),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: (){
                                    delete(context, task.documentID);
                                    Navigator.of(context).pop();
                                    successfullyDeleted(context, task['category']);
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
                padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                child: Container(
                  child: Image.asset(imagename, width: 50,),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text(task['location'].toUpperCase(), style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 250 ,
                        child: Text("Approximate "+task['cash'], style: new TextStyle(fontSize: 13.0),)),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Text(task['workerrates'], style: TextStyle(fontSize: 18),),
                        Icon(Icons.stars, size: 18 , color: Colors.yellow,)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 250,
                          child: Text(task['bio'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
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
Future delete(context , taskid) async{
  String documentId = taskid;
  Firestore.instance.collection('tasks').document(documentId).delete();
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
          content: Text( name + " is deleted from tasks" , style: TextStyle(fontSize: 13),),
        );
      }
  );
}


