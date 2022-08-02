import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/GetVisitorDetails.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
class Addvisit extends StatefulWidget {
  String roll_no;


  Addvisit(this.roll_no);

  @override
  Addvisit_state createState() => Addvisit_state(roll_no:roll_no);
}


class Addvisit_state extends State<Addvisit>{
  String entry="";
  String exit="";
  String roll_no="";
  final DBref=FirebaseDatabase.instance.reference();
  Addvisit_state({this.roll_no});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            appBar: AppBar(
              title: Text("Visitor's details"),
              backgroundColor: Colors.teal,
              // ignore: prefer_const_constructors
              titleTextStyle: TextStyle(color: Colors.white,
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

            body: Column(
                children: [
//alertbox

                  Padding(
                    padding: EdgeInsets.all(1),
                    child:AlertDialog(title:const Text("  Add visit",
                        style: TextStyle(color:Colors.teal)),
                      content:
                      Row(
                        children:[
                          Padding(padding: EdgeInsets.all(1),
                          child: ElevatedButton(child:const Text( "Add entry"),style:ElevatedButton.styleFrom(primary:Colors.teal),

                        onPressed:(){
                            _selectentry(context); }
                    ),),

                    Padding(padding: EdgeInsets.all(1),
                      child:IconButton(
                        icon: const Icon(Icons.close), onPressed: () {},),),],),), ),]
            )

        )
    );
  }
  _selectentry(BuildContext context) async {
    setState(() {
      entry = DateTime.now().toString();

    });

    DBref.child("Visitor").child(roll_no).child("Visit").push().set({
      'id':roll_no,
      'entry':entry,
      'date': DateTime.now().toString(),

    });
    DBref.once().then((DataSnapshot snapshot) {
      Map m = snapshot.value["Visitor"][roll_no]["count"];
      print("**");
      print(m);
    });

    DBref.child("Visit").push().set({
      'id':roll_no,
      'entry':entry,
      'date': DateTime.now().toString(),

    });



}


selectexit(BuildContext context) async {
    if(entry!=""){
  setState(() {
    exit= DateTime.now().toString();
  });}
    else
      {print("aDD ENTRY fisrt");}
  print(exit);}
}

