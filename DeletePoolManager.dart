import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/AddPayment.dart';
import 'package:nitc_swe/AddVisit.dart';
import 'package:nitc_swe/home.dart';

import 'getPaymentDetails.dart';
import 'getVisitDetails.dart';
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
class Manager extends StatefulWidget {



  final mname;
  final mid;
  Manager(
      this.mid, this.mname);
  @override
  Manager_state createState() => Manager_state(mid,mname);
}

class Manager_state extends State<Manager> {
  String roll_no;int count=0;
  String name;

  List l_=[];
  List l1=[];
  List l2=[];
  List l3=[];
  final DBref=FirebaseDatabase.instance.reference();
  final List mname;
  final List mid;

  Manager_state(this.mid, this.mname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pool Managers'),
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
        itemCount: mid.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            margin: EdgeInsets.all(2),

            child: Center(child:

                         Row(children:[
                                       Padding(padding: EdgeInsets.all(1),
                                       child:ElevatedButton(child:Text('${mname[index]}',style:TextStyle(color:Colors.black),),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                                         160,
                                         30,
                                       ),),),),
                                        Padding(padding: EdgeInsets.all(1),child:ElevatedButton(child:
                                        Text ('${mid[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.teal[200],fixedSize: const Size(
                                          60,
                                          30,
                                        ),),),),
                                        Padding(padding: EdgeInsets.all(1),child:ElevatedButton(child:Text("Delete",style:TextStyle(color:Colors.black)),
    onPressed:(){delete(mid[index]);
    Navigator.push(
      context,
      MaterialPageRoute(builder:
          (context) => HomeApp()),);
    },style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                                            72,
                                            30,
                                          ),),),),],),),);},));


  }
  delete(set){
    print(set);
     DBref.child("Manager").child(set).remove();



}
  }



