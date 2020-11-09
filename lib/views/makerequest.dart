import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/widgets/suggestioncard.dart';

class Makerequest extends StatefulWidget {
  @override
  _MakerequestState createState() => _MakerequestState();
}

class _MakerequestState extends State<Makerequest> {
  String category  , location;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
     return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child:Container(
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


              Text("Choose the criteria", style: TextStyle(fontSize: 13),),

              Padding(
                padding: const EdgeInsets.only(left:38.0, top: 0, right: 38, bottom: 20),
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
                padding: const EdgeInsets.only(left:38.0, top: 10, right: 38, bottom: 5),
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
                padding: const EdgeInsets.only(top:35.0),
                child: Text("Our suggestions", style: TextStyle(fontSize: 13),),
              ),

              Container(
                height: _height * 0.5,
                child: StreamBuilder(
                    stream: suggestions(context, category , location),
                    builder: (BuildContext context, snapshot) {
                      if(!snapshot.hasData) return Container(child: Center(child: Text(" ")));
                      return new ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) =>
                              suggestioncard(context, snapshot.data.documents[index]));
                    }
                ),
              ),

            ],
          ),
        ) ,
      ),
    );
  }

  Stream<QuerySnapshot>  suggestions(BuildContext context, category , location ) async* {
    String suggestedcategory = category.toLowerCase();
    String suggestedlocation = location.toLowerCase();
    yield* Firestore.instance.collection('tasks')
        .where('category', isEqualTo : suggestedcategory )
        .where('location', isEqualTo : suggestedlocation ).orderBy('workerrates', descending: true)
        .snapshots();

  }
}
