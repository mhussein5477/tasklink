import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/widgets/suggestioncard.dart';
class Categorysingle extends StatefulWidget {
  final String  category ;

  const Categorysingle({Key key, this.category}) : super(key: key);
  @override
  _CategorysingleState createState() => _CategorysingleState();
}

class _CategorysingleState extends State<Categorysingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
            stream: suggestions(context, widget.category ),
            builder: (BuildContext context, snapshot) {
              if(!snapshot.hasData) return Container(child: Center(child: Text("None available ")));
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      suggestioncard(context, snapshot.data.documents[index]));
            }
        ),
      ),
    );
  }
  Stream<QuerySnapshot>  suggestions(BuildContext context, category  ) async* {
    String suggestedcategory = category.toLowerCase();
    yield* Firestore.instance.collection('tasks')
        .where('category', isEqualTo : suggestedcategory ).orderBy('workerrates', descending: true)
        .snapshots();

  }
}
