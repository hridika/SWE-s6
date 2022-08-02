
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
class Dues extends StatefulWidget {

  final List l1;

  Dues(this.l1);



  @override
  Dues_state createState() => Dues_state(l1);
}



class Dues_state extends State<Dues> {

  List name = [];
  List<Widget> list = [];
  var i;
  final List l1;
  DatabaseReference DBref = FirebaseDatabase.instance.reference();

  Dues_state(this.l1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitors with dues'),
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
                  child:ElevatedButton(child:Text('${l1[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100]),),),





              ],),),);},),);

  }
  mark( set){
    print(set);
    DBref.child("Visit").child(set.toString()).set({

      'exit': DateTime.now().toString(),

    });DBref.child("Exit").child(set.toString()).set({

      'id':set,

    });
  }


}