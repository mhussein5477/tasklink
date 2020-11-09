import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
String category , taskbio , cash , location;
String imagename = "assets/images/chef.jpg" ;


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(category == "Cooking"){
      setState(() {
        imagename = "assets/images/chef.jpg";
      });
    }else if (category== "Electrician"){
      setState(() {
        imagename = "assets/images/worker.png";
      });
    }else if(category == "Plumbing"){
      setState(() {
        imagename = "assets/images/plumber.png";
      });
    }else if(category== "Laundry"){
      setState(() {
        imagename = "assets/images/laundry.png";
      });
    }else if(category == "Shopping"){
    setState(() {
      imagename = "assets/images/shoping.png";
    });
    }else if(category == "Gardening"){
     setState(() {
       imagename = "assets/images/gardening.png";
     });
    }else if(category == "Delivery"){
     setState(() {
       imagename = "assets/images/delivery.png";
     });
    }else if(category == "Cleaning"){
     setState(() {
       imagename = "assets/images/clineaning.jpg";
     });
    }else if(category  == "Driving"){
      setState(() {
        imagename = "assets/images/driving.png";
      });
    }else if(category  == "Home repairs"){
      setState(() {
        imagename = "assets/images/homerepaires.png";
      });
    }else if(category == "Line booking"){
      setState(() {
        imagename = "assets/images/line.png";
      });
    }else if(category == "Luggage carrier"){
      setState(() {
        imagename = "assets/images/laguage.png";
      });
    }else if(category == "Messenger"){
      setState(() {
        imagename = "assets/images/message.png";
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
              child:Container(
                  child: Form(
                    key: _formKey ,
                    child: Column(
                    children: <Widget>[
                     Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(top: 35.0 ,left: 10),
                           child: IconButton(
                             icon: Icon(Icons.arrow_back, color: Colors.black,),
                             onPressed: (){
                               Navigator.pop(context);
                             },
                           ),
                         ),
                       ],
                     ),


                      Container(
                        child: Image.asset(imagename , width: 100,),
                     ),

                      Padding(
                        padding: const EdgeInsets.only(left:38.0, top: 10, right: 38, bottom: 20),
                        child: DropdownButtonFormField(
                          value: category,
                          items: ["Plumbing","Electrician", "Laundry" , "Shopping", "Gardening", "Cooking","Delivery","Cleaning","Driving","Home repairs"
                                , "Line booking", "Luggage carrier", "Messenger" ].map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          )).toList(),
                          onChanged: (value) {
                            setState(() => category = value);
                          },
                          hint: Text('Enter category', style: TextStyle(color: Colors.black),),
                        ),),

                      Padding(
                        padding: const EdgeInsets.only(top: 1.0, left: 38, right: 38),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() =>   taskbio = value.trim());
                          } ,
                          keyboardType: TextInputType.text ,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Bio to describe the skills",
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:38.0, top: 10, right: 38, bottom: 20),
                        child: DropdownButtonFormField(
                          value: location,
                          items: ["Nairobi","Nakuru", "Kisumu" , "Mombasa", "Eldorect", "Kericho","Meru","Garissa","Kisii","Embu"
                             ].map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          )).toList(),
                          onChanged: (value) {
                            setState(() => location = value);
                          },
                          hint: Text('Enter Location', style: TextStyle(color: Colors.black),),
                        ),),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 38, right: 38),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() =>   cash = value.trim());
                          } ,
                          keyboardType: TextInputType.text ,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Approximate Cash",
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:35.0, bottom: 200),
                        child: RaisedButton(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 13.0, bottom: 13.0, left: 23.0, right: 23.0),
                            child: Text(
                              "Add Task",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onPressed:
                          category == null || taskbio == null || cash == null || location == null ? null : () async{
                            var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
                            Firestore.instance.collection('users').where('uid', isEqualTo: uid).getDocuments().then((docs){
                              if(docs.documents[0].exists){
                                var workername = docs.documents[0].data['name'];
                                var workerrate = docs.documents[0].data['totalcumulative'];
                                Firestore.instance.collection('tasks').add({
                                  "category" :  category.toLowerCase() ,
                                  "name" :  workername.toLowerCase(),
                                  "bio": taskbio,
                                  "location" : location.toLowerCase(),
                                  'cash': cash ,
                                  "uid" : uid,
                                  "workerrates": workerrate
                                });
                              }
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),

                    ],
                    ),
                  ),
              ) ,
      ),
    );
  }
}
