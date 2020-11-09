import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tasksingle extends StatefulWidget {
  final String name, category ,  cash , location , bio, uid, taskuid;

  const Tasksingle({Key key, this.name, this.category, this.cash, this.location, this.bio , this.uid , this.taskuid}) : super(key: key);
  @override
  _TasksingleState createState() => _TasksingleState();
}

class _TasksingleState extends State<Tasksingle> {
  String imagename;
  String requestbio, clientstreetarea, clientphoneno;


  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();


  @override
  Widget build(BuildContext context) {
    String category = widget.category;
    String appointmentdate= DateFormat('dd/MM/yyyy').format(selectedDate).toString();
    String appointmenttime = selectedTime.toString();

    String clientlocation= widget.location;
    final _formKey = GlobalKey<FormState>();
    if(category == "cooking"){
      imagename = "assets/images/chef.jpg";
    }else if (category == "electrician"){
      imagename = "assets/images/worker.png";
    }else if(category == "plumbing"){
      imagename = "assets/images/plumber.png";
    }else if(category == "laundry"){
      imagename = "assets/images/laundry.png";
    }else if(category == "shopping"){
      imagename = "assets/images/shoping.png";
    }else if(category == "gardening"){
      imagename = "assets/images/gardening.png";
    }else if(category == "delivery"){
      imagename = "assets/images/delivery.png";
    }else if(category == "cleaning"){
      imagename = "assets/images/clineaning.jpg";
    }else if(category == "driving"){
      imagename = "assets/images/driving.png";
    }else if(category == "home repairs"){
      imagename = "assets/images/homerepaires.png";
    }else if(category == "line booking"){
      imagename = "assets/images/line.png";
    }else if(category == "luggage carrier"){
      imagename = "assets/images/laguage.png";
    }else if(category == "messenger"){
      imagename = "assets/images/message.png";
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                padding: const EdgeInsets.only(top:18.0),
                child: Text(widget.name.toUpperCase(), style: TextStyle(fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(widget.category.toUpperCase(), style: TextStyle(fontSize: 15),),
              ),

              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("Aproximate cash : " +widget.cash, style: TextStyle(fontSize: 13),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(widget.bio, style: TextStyle(fontSize: 12),),
              ),

              Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Text("Make an Appointment", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 38, right: 38),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() =>   requestbio = value.trim());
                          } ,
                          keyboardType: TextInputType.text ,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Send a message",
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 38, right: 38),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() =>   clientstreetarea = value.trim());
                          } ,
                          keyboardType: TextInputType.text ,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Street Area",
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 38, right: 38),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() =>   clientphoneno = value.trim());
                          } ,
                          keyboardType: TextInputType.number ,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "07123456789",
                          ),
                        ),
                      ),

                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.green,
                      ),

                      RaisedButton(
                        onPressed: () => _selecttime(context),
                        child: Text("Select Time" , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        color: Colors.green,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: Text(DateFormat('dd/MM/yyyy').format(selectedDate).toString() +" , "+ appointmenttime),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:35.0, bottom: 200),
                        child: RaisedButton(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 13.0, bottom: 13.0, left: 23.0, right: 23.0),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onPressed:
                          requestbio == null || clientstreetarea == null || clientphoneno == null ? null : () async{
                            var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
                            Firestore.instance.collection('users').where('uid', isEqualTo: uid).getDocuments().then((docs){
                              if(docs.documents[0].exists){
                                var clientname = docs.documents[0].data['name'];
                                Firestore.instance.collection('requestedTasks').add({
                                  "clientname" : clientname,
                                  "clientlocation" : widget.location.toLowerCase(),
                                  "clientphone": clientphoneno,
                                  "clientstreetarea" : clientstreetarea,
                                  'clientmessage': requestbio ,
                                  "clientuid" : uid,
                                  "appointmentdate" : appointmentdate,
                                  "appointmenttime" : appointmenttime,
                                  "workername": widget.name,
                                  "bio": widget.bio,
                                  "taskcategory": widget.category,
                                  "workerlocation": widget.location,
                                  "workeruid": widget.uid,
                                  "cash" : widget.cash,
                                  "status" : "Pending",
                                  "taskuid": widget.taskuid
                                });
                              }
                            });
                            Navigator.of(context).pushReplacementNamed('/home');
                            successfullysent(context, widget.name);

                          },
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future successfullysent(context, workername){
    String name = workername;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text("Successfully sent", style: TextStyle(color: Colors.green),),
            content: Text( name.toUpperCase() + " will reply you , check your notification" , style: TextStyle(fontSize: 13),),
          );
        }
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  _selecttime(BuildContext context) async{
    TimeOfDay timepicked = await showTimePicker(
        context: context,
        initialTime: selectedTime,

    );
    if (timepicked != null && timepicked != selectedTime){
      setState(() {
        selectedTime = timepicked;
      });
    }
  }
}
