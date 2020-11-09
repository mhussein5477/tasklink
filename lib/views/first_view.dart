import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tasklink/widgets/custom_dialog.dart';
import 'package:tasklink/widgets/searchcard.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  final primaryColor = Colors.green[400];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
        actions: <Widget>[
        ],
      ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Icon(Icons.supervised_user_circle, size: 70,),
                ),
                Padding(
                  padding:  const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                  child: Container(
                    color: Colors.green,
                    child: ListTile(
                      title: Text('Sign In', style: TextStyle(color: Colors.white),),
                      leading: Icon(Icons.exit_to_app, size: 23, color: Colors.green,),
                      onTap: ()   {
                        Navigator.of(context).pushReplacementNamed('/signIn');
                      },),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                  child: Container(
                    color: Colors.green,
                    child: ListTile(
                      title: Text('Sign Up', style: TextStyle(color: Colors.white),),
                      leading: Icon(Icons.exit_to_app, size: 23, color: Colors.green,),
                      onTap: ()   {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Create an account?",
                            description:
                            "An account for either a CLIENT or a MANUAL WORKER.",
                            primaryButtonText: "Sign Up",
                            primaryButtonRoute: "/signUp",

                          ),
                        );
                      },),
                  ),
                ),
              ],
            ),
          ),
        ),

        resizeToAvoidBottomPadding: false,
        body: Container(
          width: _width,
          height: _height,
          color: primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                children: <Widget>[
                  Text(
                    "Task Link",
                    style: TextStyle(fontSize: 44, color: Colors.white , fontFamily: 'Phamelo'),
                  ),
                  SizedBox(height: _height * 0.04),
                  AutoSizeText(
                    "Find the nearest manual workers with good Experience and Skill Sets",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: _height * 0.1),
                  Row(
                    children: <Widget>[
                      AutoSizeText(
                        "What do you need help with today ?",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: _height * 0.03),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom:18.0),
                        child: GestureDetector(
                          onTap: (){
                            showSearch(context: context, delegate: ItemSearch() );
                          },
                          child: Container(
                              width: _width*0.8,
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(right:8.0, top: 10, bottom: 10,left: 15),
                                      child: Icon(Icons.search, size: 30,)
                                  ),
                                  Text("Search Here ", style: TextStyle(color: Colors.grey, fontSize: 15),)
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),



                  Container(
                    height: _height * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/images/chef.jpg", width: 80,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Text("Cooking", style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                ),
                           ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/worker.png", width: 75,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Electrician", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/plumber.png", width: 75,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Plumbing", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/laundry.png", width: 60,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Laundry", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shoping.png", width: 70,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Shopping", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/gardening.png", width: 70,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Gardening", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/delivery.png", width: 70,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Delivery", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/clineaning.jpg", width: 70,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Cleaning", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/driving.png", width: 65,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Driving", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/homerepaires.png", width: 65,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Home repairs", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/line.png", width: 65,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Line booking", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/laguage.png", width: 65,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Luggage carrier", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed('/signIn');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _height * 0.1,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/message.png", width: 65,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text("Messenger", style: TextStyle(color: Colors.white),),
                                  )
                                ],
                              ),
                            ),
                          ) ,
                        ),


                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      );
  }
}
// searching code
class ItemSearch extends SearchDelegate<FirstView>{

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        primaryColor: Colors.green,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        primaryColorBrightness: Brightness.light,
        textTheme: theme.textTheme.copyWith(title: theme.textTheme.title.copyWith(color: theme.primaryTextTheme.title.color))
    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        query = "";
      },
    ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than one letters.",
            ),
          )
        ],
      );
    }
    else {
      return Container(
        color: Colors.grey[100],
        child : StreamBuilder(
          stream: query != "" && query != null ?
          Firestore.instance.collection('tasks').where(
              'category', isGreaterThanOrEqualTo : query).snapshots()
              : null,
          builder:   (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');


            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    searchcard(context, snapshot.data.documents[index]));
          },
        ),
      );

    }

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Container(
      color: Colors.grey[100],
      child: StreamBuilder(
        stream: query != "" && query != null ?
        Firestore.instance.collection('tasks').where(
            'category', isGreaterThanOrEqualTo : query).snapshots()
            : null ,
        builder:   (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          if(snapshot.data == null) return Center(child: Text('No result found'));

          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index) =>
                  searchcard(context, snapshot.data.documents[index]));
        },
      ),
    );
  }


}
