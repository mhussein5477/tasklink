import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
Widget workersnotification(BuildContext context, DocumentSnapshot request) {


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
                child: Text(
                  request['clientname'].toUpperCase(),
                  style:TextStyle(fontSize: 15 , fontWeight: FontWeight.w600, color: Colors.green) ,),
              ),


              Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 1.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "On : " + request['appointmentdate'] + " , " + request['appointmenttime'],
                        style:TextStyle(fontSize: 15 , fontWeight: FontWeight.w400) ,),
                    ],
                  )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("About : " + request['taskcategory'].toUpperCase(), style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Message  " , style: new TextStyle(fontSize: 15.0 , fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 250,
                        child: Text(request['clientmessage'] , style: new TextStyle(fontSize: 14.0 , fontWeight: FontWeight.w400 , color: Colors.grey , fontStyle: FontStyle.italic),)

                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Your approximation : " + request['cash'], style: new TextStyle(fontSize: 15.0 , fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Location : " + request['clientlocation'].toUpperCase(), style: new TextStyle(fontSize: 15.0 , fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Street area : " + request['clientstreetarea'], style: new TextStyle(fontSize: 15.0 , fontWeight: FontWeight.w400),),
                  ],
                ),
              ),


              request['status'] == "Pending" ?
              Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: FlatButton(
                          child: Text("Available" ,style: TextStyle(color: Colors.white),),
                          color: Colors.green,
                          onPressed: (){
                              Firestore.instance.collection("requestedTasks").document(request.documentID).updateData({'status': 'Accepted'});
                              accepted(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Container(
                          width: 120,
                          child: FlatButton(
                            child: Text("Not Available", style: TextStyle(color: Colors.white),),
                            color: Colors.red,
                            onPressed: (){
                              Firestore.instance.collection("requestedTasks").document(request.documentID).updateData({'status': 'Notavailable'});
                              notavailable(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
              ) : Text(" "),

              request['status'] == "Accepted" ?
              FlatButton(
                color: Colors.green,
                child: Icon(Icons.phone,color: Colors.white,),
                onPressed: (){
                call(request['clientphone']);

                },
              ): Text(" ", style: TextStyle(fontSize: 1),),

              request['status'] == "Notavailable" ? Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("You are not available" ),
              ) : Text(" ", style: TextStyle(fontSize: 1),),



            ],
          ),
        ),
      ),
    ),
  );
}

call (clientphone){

  launch("tel:"+clientphone);
  print(clientphone);

}

Future accepted(context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Accepted", style: TextStyle(color: Colors.green),),
          content: Text("Call the client upon reaching the Street Area" , style: TextStyle(fontSize: 13),),
        );
      }
  );
}
Future notavailable(context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Not available", style: TextStyle(color: Colors.red),),
          content: Text(" " , style: TextStyle(fontSize: 13),),
        );
      }
  );
}




