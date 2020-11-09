import 'package:flutter/material.dart';
import 'package:tasklink/views/categorysingle.dart';


class Category extends StatefulWidget {

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {


  @override
  Widget build(BuildContext context) {
    String category;

    final _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.only(top:8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                         category : "cooking"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/chef.jpg", width: 80,),
                       Text("Cooking")
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:35.0, right: 35),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Categorysingle(
                             category : "electrician"
                         )),
                       );
                     },
                     child: Column(
                       children: <Widget>[
                         Image.asset("assets/images/worker.png", width: 80,),
                         Text("Electrician")
                       ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "plumbing"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/plumber.png", width: 80,),
                       Text("Plumbing")
                     ],
                   ),
                 )
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top:25.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "laundry"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/laundry.png", width: 60,),
                       Text("laundry")
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:35.0, right: 35),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Categorysingle(
                             category : "shopping"
                         )),
                       );
                     },
                     child: Column(
                       children: <Widget>[
                         Image.asset("assets/images/shoping.png", width: 70,),
                         Text("shopping")
                       ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "gardening"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/gardening.png", width: 70,),
                       Text("gardening")
                     ],
                   ),
                 )
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top:25.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "delivery"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/delivery.png", width: 60,),
                       Text("delivery")
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:35.0, right: 35),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Categorysingle(
                             category : "cleaning"
                         )),
                       );
                     },
                     child: Column(
                       children: <Widget>[
                         Image.asset("assets/images/clineaning.jpg", width: 70,),
                         Text("cleaning")
                       ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "driving"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/driving.png", width: 70,),
                       Text("driving")
                     ],
                   ),
                 )
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top:25.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "home repairs"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/homerepaires.png", width: 60,),
                       Text("home repairs")
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left:35.0, right: 35),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Categorysingle(
                             category : "line booking"
                         )),
                       );
                     },
                     child: Column(
                       children: <Widget>[
                         Image.asset("assets/images/line.png", width: 60,),
                         Text("line booking")
                       ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Categorysingle(
                           category : "luggage carrier"
                       )),
                     );
                   },
                   child: Column(
                     children: <Widget>[
                       Image.asset("assets/images/laguage.png", width: 70,),
                       Text("luggage carrier")
                     ],
                   ),
                 )
               ],
             ),
           ),

          Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Categorysingle(
                          category : "messenger"
                      )),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/message.png", width: 80,),
                      Text("messenger")
                    ],
                  ),
                ),
              ],
            ),
          )
         ],

      ),
    );
  }
}
