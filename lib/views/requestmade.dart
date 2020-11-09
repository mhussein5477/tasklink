import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/widgets/requestmadecard.dart';

class Requestmade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: StreamBuilder(
          stream: getrequests(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Container(child: Center(child: Text("No Notification")));
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    requestmadecard(context, snapshot.data.documents[index])); // buildcard in custom widget
          }
      ),
    );
  }

  Stream<QuerySnapshot>  getrequests(BuildContext context) async* {
    var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
    yield*  Firestore.instance.collection('requestedTasks').where('clientuid', isEqualTo : uid ).snapshots();
  }
}
