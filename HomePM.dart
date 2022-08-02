
import 'package:flutter/material.dart';
import 'package:nitc_swe/GetVisitorDetails.dart';
import 'package:nitc_swe/addmanager.dart';
import 'package:nitc_swe/addvisitor.dart';
import 'package:nitc_swe/dailyreport.dart';
import 'package:nitc_swe/home.dart';
import 'package:nitc_swe/main.dart';
import 'package:nitc_swe/profile.dart';
import 'package:nitc_swe/searchprofile.dart';
import 'package:nitc_swe/selectdate.dart';
import 'package:nitc_swe/selectdaterange.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'DeletePoolManager.dart';
import 'VisitorsWithDues.dart';
import 'activelist.dart';
class Homepm extends StatefulWidget {
  const Homepm({ key}) : super(key: key);

  @override
  Homepm_state createState() => Homepm_state();
}

class Homepm_state extends State<Homepm> {
  var i=0;
  final roll_no=TextEditingController();
  var count;
  final name=TextEditingController();
  final category=TextEditingController();
  final contact1=TextEditingController();
  final contact2=TextEditingController();
  final email=TextEditingController();
  final dues=TextEditingController();
  List mname=[];
  List mid=[];
  List due=[];

  final DBref=FirebaseDatabase.instance.reference();
  List l1=[];
  List l2=[];
  List l=[];
  List visit1 =[];
  List visit2=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            appBar: AppBar(
              title: Text('Homepage'),
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
              actions: [
                //list if widget in appbar actions
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),   //don't specify icon if you want 3 dot menu
                  color: Color.fromRGBO(30, 223, 212, 1),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: ElevatedButton(child: const Text("Add visitor",
                          style:TextStyle(color:Colors.black)),style:ElevatedButton.styleFrom(primary:Color.fromRGBO(30, 223, 212, 1),fixedSize: const Size(
                        200,
                        30,),),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => Addvisitor()),);}
                      ),
                    ),

                    PopupMenuItem<int>(
                      value: 5,
                      child: ElevatedButton(child: const Text("List of active users",
                          style:TextStyle(color:Colors.black)),style:ElevatedButton.styleFrom(primary:Color.fromRGBO(30, 223, 212, 1),fixedSize: const Size(
                        200,
                        30,),),
                          onPressed: () async {get_active();

                          setState(() {
                            l1=[];
                            l2=[];
                          });


                          await Future.delayed(const Duration(seconds:2));
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>Active(visit1,visit2)) );
                          }
                      ),
                    ),

                    PopupMenuItem<int>(
                      value: 5,
                      child: ElevatedButton(child: const Text("Logout",
                          style:TextStyle(color:Colors.black)),style:ElevatedButton.styleFrom(primary:Color.fromRGBO(30, 223, 212, 1),fixedSize: const Size(
                        200,
                        30,),),
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => MyHomePage()),);}

                      ),
                    ),
                  ],
                  onSelected: (item) => {print(item)},
                ),

              ],
            ),

            body: SingleChildScrollView(child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 110, 20, 20),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0.8)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 0.8, color: Theme
                              .of(context)
                              .primaryColor)
                      ),
                      hintText: "   Search by membership id",

                      prefixIcon: IconButton(
                          icon: const Icon(Icons.search), onPressed: () {}),

                    ),
                    controller: roll_no,),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(child:const Text( "Get visitor details",
                  ),style:ElevatedButton.styleFrom(primary:Colors.teal),
                      onPressed:() async {List l=[];
                      DBref.once().then((DataSnapshot snapshot) async {
                        Map m=snapshot.value["Member"];
                        m.forEach((k,v)=>l.add(k));
                        print(l);
                        if(!l.contains(roll_no.text))
                        { final snackBar = SnackBar(
                          content: const Text("Membership id doesn't exist"),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {
                            },
                          ),
                        ); ScaffoldMessenger.of(context).showSnackBar(
                            snackBar);}
                        else{
                          get_details();

                          if(l==[]){print("Membership id doesn't exist");}

                          await Future.delayed(const Duration(seconds:2));
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  Visitor(roll_no: roll_no.text,
                                      name: name.text,
                                      category: category.text,
                                      email: email.text,
                                      contact1: contact1.text,
                                      contact2: contact2.text,
                                      dues: dues.text,count:count))

                          );}});}),),Padding(
                  padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
                  child:Image.asset(
                    'asset/waves.jpg',
                    width: 600,
                    height: 200,
                    //fit: BoxFit.cover,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomLeft,
                  ),),],
            ))

        ));}
  get_details() {
    Map m;

    DBref.once().then((DataSnapshot snapshot) {
      Map m=snapshot.value["Visitor"][roll_no.text];
      if(m!=null) {
        i = 1;
        l = [];

        m.forEach((k, v) => l.add(v));
        print(l);

        print(m);
        name.text = m['name'];
        category.text = m['category'];
        email.text = m['email'];
        contact1.text = m['contact1'];
        contact2.text = m['contact2'];
        dues.text = m['dues'];
        count=m['count'];
        print(count);

      }
      else{print("Error");}
      return 1;
    });


  }
  get_active(){List l=[];visit1=[];visit2=[];List l3=[];List l4=[];
  DBref.once().then((DataSnapshot snapshot) {List l2=[];List l3=[];
  Map m = snapshot.value["Entry"];
  m.forEach((k, v) => l.add(v));
  print(l);

  var i=0;
  for(i=0;i<l.length;i++){
    Map m2=l[i];m2.forEach((key, value) =>l2.add(value));
    print(l2); }/* returns roll_number in entry*/
  for(var j=0;j<l2.length;j++){
    Map m3 = snapshot.value["Exit"];
    m3.forEach((k, v) => l3.add(v));
    print(l3);
    for(i=0;i<l3.length;i++){
      Map m4=l3[i];m4.forEach((key, value) =>l4.add(value));
      print(l4); }/*returns the roll_no list in exit*/
    if(!l4.contains(l2[j])){
      visit1.add(l2[j]);
      visit2.add(l2[j]);}}
  });}

  get_vis_dues(){
    DBref.once().then((DataSnapshot snapshot) {
      Map m = snapshot.value["Visitor"]; //get all values of visitor
      List l2=[];
      if (m != null) {
        l = [];
        m.forEach((k, v) => l.add(v));
      } //converting map to list
      for (i=0;i<l.length;i++)
      {l[i].forEach((k,v)=>l2.add(v));
      print(l2);
      if(l2[2]=='0')
        print(l2[0]);
      l2=[];
      }

    });
  }
  get_dues(){
    List l=[];
    List l2=[];
    List l3=[];
    List l4=[];
    DBref.once().then((DataSnapshot snapshot) {
      Map m = snapshot.value["Member"];
      print(m);
      if (m != null) {
        l = [];
        m.forEach((k, v) => l.add(v));


        for (var i = 0; i < l.length; i++) {
          Map m3 = l[i];
          m3.forEach((k, v) => l2.add(v));
        }
        //all membership ids

        Map m2 = snapshot.value["Payment"];
        if (m2 != null) {
          l3 = [];
          print(m2);
          m2.forEach((k, v) => l3.add(k));
        }

        print(l3);
      }
      for (i = 0; i < l2.length; i++)
        if (!l3.contains(l2[i])) {
          due.add(l2[i]);
        }});
  }
  get_manager_details() {List l1=[];List l2=[];List l=[];mname=[];mid=[];
  DBref.once().then((DataSnapshot snapshot) {
    Map m = snapshot.value["Manager"];
    if (m != null) {
      i = 1;
      l = [];

      m.forEach((k, v) => l.add(v));
      for(var i=0;i<l.length;i++){
        Map m2=l[i];
        l2=[];
        m2.forEach((key, v) {l2.add(v);});
        mname.add(m2['name']);
        mid.add(m2['id']);
      }
    }
    else {
      print("Error");
    }
    return 1;
  });

  }}