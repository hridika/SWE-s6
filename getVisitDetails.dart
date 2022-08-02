
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/AddPayment.dart';
import 'package:nitc_swe/AddVisit.dart';
import 'package:nitc_swe/home.dart';
class VisitDetails extends StatefulWidget {

  final datelist;
  final entrylist;
  final exitlist;
  VisitDetails(this.datelist, this.entrylist, this.exitlist);
  @override
  VisitDetails_state createState() => VisitDetails_state(this.datelist,this.entrylist,this.exitlist);
}

class VisitDetails_state extends State<VisitDetails> {
final datelist;final exitlist;final entrylist;
  String name;
  String contact1;
  String contact2;
  String email;
  String category;
  String dues;
  String entry="";
  String date="";
  String amount="";
  String receipt_no;
  int count;
  final DBref=FirebaseDatabase.instance.reference();
  VisitDetails_state(
      this.datelist,this.entrylist,this.exitlist);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('Visit details'),
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
        body:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: datelist.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: EdgeInsets.all(2),

              child: Center(
                child: Row(children:[
                  Padding(padding: EdgeInsets.all(1),
                    child:ElevatedButton(child:Text('${datelist[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100]),),),
                   Padding(padding: EdgeInsets.all(1),child:ElevatedButton(child:
                   Text ('${entrylist[index]}',style:TextStyle(color:Colors.black)),onPressed:(){},style:ElevatedButton.styleFrom(primary:Colors.teal[200]),)),


                ],),),);},)));






  }



  }