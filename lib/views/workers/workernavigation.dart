import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/views/workers/addtask.dart';
import 'package:tasklink/views/workers/requests.dart';
import 'package:tasklink/views/workers/workerhome.dart';
import 'package:tasklink/widgets/provider_widget.dart';

class WorkerNavigation extends StatefulWidget {
  @override
  _WorkerNavigationState createState() => _WorkerNavigationState();
}

class _WorkerNavigationState extends State<WorkerNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Workerhome(),
    Requests(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Worker's Account"),centerTitle: true,
          actions: <Widget>[

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()),
                  );
                },),),
          ],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.green[400], //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(

            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child:  FutureBuilder(
                    future: Provider.of(context).auth.getCurrentUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return displayUserInformation(context, snapshot);
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                  ),
                ),



                Padding(padding: EdgeInsets.only(top: 10),),

                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14, top: 5),
                  child: Container(
                    color: Colors.white,
                    child: ListTile(

                      title: Text('LOGOUT'),
                      leading: Icon(Icons.exit_to_app, size: 23, color: Colors.green,),
                      onTap: ()   {
                        Navigator.of(context).pushReplacementNamed('/firstview');
                      },),
                  ),
                ),

              ],
            ),

          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.green[400],
          buttonBackgroundColor: Colors.green[400],

          backgroundColor: Color(0x00000000),
          onTap: onTabTapped,

          items: <Widget>[
            Icon(Icons.home, color: Colors.white, ),
            Icon(Icons.notifications_active , color: Colors.white,),
          ],

        ),
      ),
    );
  }
  void onTabTapped(int index) {

    setState(() {
      _currentIndex = index;
    });
  }


  Widget displayUserInformation(context, snapshot) {
    final authData = snapshot.data;

    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Icon(Icons.account_circle, color: Colors.white, size: 60,),
          ),
          Padding(padding: const EdgeInsets.only(top: 5.0),),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${authData.displayName}",
              style: TextStyle(fontSize: 15 , color: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              " ${authData.email}",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),



        ]
    );
  }




}
