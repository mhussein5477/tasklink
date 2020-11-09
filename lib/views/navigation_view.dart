import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tasklink/views/home_view.dart';
import 'package:tasklink/views/makerequest.dart';
import 'package:tasklink/views/requestmade.dart';
import 'package:tasklink/widgets/provider_widget.dart';
import 'favourites.dart';
import 'Category.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    Category(),
    Requestmade(),
    Favourites(),

  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("TaskLink" , style: TextStyle(fontFamily: 'Phamelo', fontSize: 27),),centerTitle: true,
        actions: <Widget>[

          IconButton(
            onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Makerequest()),);},
            icon: Icon(Icons.search),
          )

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
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 50),
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
            Icon(Icons.category , color: Colors.white,),
            Icon(Icons.notifications_active , color: Colors.white,),
            Icon(Icons.contacts , color: Colors.white,),
          ],

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

