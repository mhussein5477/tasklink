import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Rate extends StatefulWidget {
  final String workername, workeruid ,  taskcategory , clientuid , appointmentdate , appointmenttime, requestedtaskdocumentid, bio, cash,location , taskuid;

  const Rate({Key key, this.workername,
    this.workeruid,
    this.taskcategory,
    this.clientuid,
    this.appointmentdate ,
    this.appointmenttime ,
    this.requestedtaskdocumentid,
    this.bio,
    this.cash,
    this.taskuid,
    this.location}) : super(key: key);
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  String stars;
  String favourite;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.thumb_up, size: 24,color: Colors.yellow,),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("Rate " ,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top:27.0),
              child: Text(widget.workername.toUpperCase(),  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Text(widget.taskcategory.toUpperCase() , style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Text(widget.appointmentdate.toUpperCase() , style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Text(widget.appointmenttime.toUpperCase() , style: TextStyle(fontSize: 15)),
            ),

            Padding(
              padding: const EdgeInsets.only(left:38.0, top: 10, right: 38, bottom: 5),
              child: DropdownButtonFormField(
                value: stars,
                items: ["1","2", "3" , "4", "5",
                ].map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                )).toList(),
                onChanged: (value) {
                  setState(() => stars = value.toString());
                },
                hint: Row(children: <Widget>[Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Text("Choose the no of stars"),
                ), Icon(Icons.star),],),
              ),),

            Padding(
              padding: const EdgeInsets.only(left:38.0, top: 10, right: 38, bottom: 5),
              child: DropdownButtonFormField(
                value: favourite,
                items: ["Yes","No"
                ].map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                )).toList(),
                onChanged: (value) {
                  setState(() => favourite = value.toString());
                },
                hint: Row(children: <Widget>[Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Text("Add to favourites"),
                ), Icon(Icons.contacts, size: 20,),],),
              ),),
           
            Padding(
              padding: const EdgeInsets.only(top:38.0),
              child: FlatButton(
                color: Colors.yellow,
                child: Text("Rate"),
                onPressed:  stars == null || favourite == null ? null : () {
                  var  uid = widget.workeruid;
                  Firestore.instance.collection('users').where('uid', isEqualTo: uid).getDocuments().then((docs){
                    var documentid = docs.documents[0].documentID;
                    if(docs.documents[0].exists){
                      /* stars calculations*/
                      var newstars = int.parse(stars);
                      var previousstars = int.parse(docs.documents[0].data['totalstars']);
                      var totalnewstars = previousstars + newstars;

                      /* task calculatons */
                      var previoustask = int.parse(docs.documents[0].data['totaltaskcompleted']);
                      var totalnewtask = previoustask + 1 ;

                      /* rating calculations */
                      var cumulative = totalnewstars / totalnewtask;
                      var totalcumulative = cumulative.round();
                      var totacumulativestring = totalcumulative.toString();

                      /* updating according to the new values*/
                      Firestore.instance.collection("users").document(documentid).updateData({
                        'totalstars': totalnewstars.toString(),
                        'totaltaskcompleted' : totalnewtask.toString() ,
                        'totalcumulative': totacumulativestring
                      });
                      
                      Firestore.instance.collection("tasks").document(widget.taskuid).updateData({
                        'workerrates' : totacumulativestring
                      });



                      /* Delete the requested task comeleted*/
                      var requesteddocumentid = widget.requestedtaskdocumentid;
                      print(requesteddocumentid);
                     Firestore.instance.collection('requestedTasks').document(requesteddocumentid).delete();

                     /* add to favourites */
                      if( favourite == "Yes"){
                        Firestore.instance.collection("favourites").add({
                          "name" : widget.workername,
                          "workeruid": widget.workeruid,
                          "bio" : widget.bio,
                          "cash" : widget.cash,
                          "category":widget.taskcategory,
                          "location": widget.location,
                          "clientuid": widget.clientuid,
                          "taskuid" : widget.taskuid
                        });
                      }

                      Navigator.pop(context);
                      thanks(context);
                    }
                  });
                },
              ),
            )

          ],
        ),
      ),
    );
  }
  Future thanks(context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text("Thank you for using Task link", style: TextStyle(color: Colors.green, fontSize: 15),),
            content: Text(" " , style: TextStyle(fontSize: 13),),
          );
        }
    );
  }

}
