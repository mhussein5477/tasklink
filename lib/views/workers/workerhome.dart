import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/services/auth_service.dart';
import 'package:tasklink/views/workers/addtask.dart';
import 'package:tasklink/widgets/provider_widget.dart';
import 'package:tasklink/widgets/workercard.dart';
class Workerhome extends StatefulWidget {
  @override
  _WorkerhomeState createState() => _WorkerhomeState();
}

class _WorkerhomeState extends State<Workerhome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: StreamBuilder(
          stream: getTasks(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    workercard(context, snapshot.data.documents[index])); // buildcard in custom widget
          }
      ),
    );
  }


  Stream<QuerySnapshot>  getTasks(BuildContext context) async* {
    var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
    yield*  Firestore.instance.collection('tasks').where('uid', isEqualTo : uid ).snapshots();
  }
}
