import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tasklink/widgets/provider_widget.dart';


Widget searchcard(BuildContext context, DocumentSnapshot task) {

  return new Container(
    child: Card(
      child: FlatButton(
        onPressed: (){
          Navigator.of(context).pushReplacementNamed('/signIn');
        },
        child: Padding(
          padding: const EdgeInsets.only(top : 16.0 , bottom: 16),
          child: Column(
            children: <Widget>[


              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(children: <Widget>[
                  AutoSizeText(task['name'].toUpperCase()+" - "+task['category'], style: new TextStyle(fontSize: 14.0, ),),

                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text(task['location'], style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
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



