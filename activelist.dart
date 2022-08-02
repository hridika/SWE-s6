
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            color: Colors.red,
            child: _showFirstListView(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: _showSecondListView(),
          ),
        )
      ],
    );
  }

  Widget _showFirstListView() {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Text("First ListView");
      },
    );
  }

  Widget _showSecondListView() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text("FirstLine"),
                SizedBox(
                  height: 15,
                ),
                Text("SecondLine"),
                SizedBox(
                  height: 15,
                ),
                Text("ThirdLine"),
              ],
            ),
          );
        });
  }
}
class Active extends StatefulWidget {

  final List l1;
  final List l2;

  Active(this.l1, this.l2);



  @override
  Active_state createState() => Active_state(l1, l2);
}



  class Active_state extends State<Active> {

    List name = [];
    List<Widget> list = [];
    final l2;
    var i;
    final l1;
    DatabaseReference DBref = FirebaseDatabase.instance.reference();

    Active_state(this.l1, this.l2);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('List of active users'),
            backgroundColor: Colors.teal,
            // ignore: prefer_const_constructors
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[Shadow(
                offset: Offset(1.0, 1.0),
                color: Colors.tealAccent,

              )
              ],
            ),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: l1.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),

                  child: Center(
                    child: Row(children:[
                      Padding(padding: EdgeInsets.all(1),
                      child:ElevatedButton(child:Text('${l1[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                        150,
                        30,),),),), Padding(padding: EdgeInsets.all(1),child:ElevatedButton(child:
                Text ('${l2[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.teal[200],fixedSize: const Size(
                  150,
                  30,),),)),


                Padding(padding: EdgeInsets.all(1),child:ElevatedButton(child:Text("Exit",style:TextStyle(color:Colors.black)),onPressed:(){mark(l1[index],l2[index]);},style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                  80,
                  30,),),),),
                  ],),),);},),);


    }
    mark( set,set2){
      print(set);  var date = new DateTime.now().toString();

      var dateParse = DateTime.parse(date);

      var fd = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
      var ft = "${dateParse.hour}-${dateParse.minute}";
      DBref.child("Visit").child(set.toString()).set({

        'exit': ft,

      });DBref.child("Exit").child(set.toString()).set({

        'id':set,

      });print(set2); DBref.child("Visitor").child(set).child("Visit").child(set2).update({"exit":ft});
    }


  }