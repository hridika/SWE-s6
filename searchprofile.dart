import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nitc_swe/profile.dart';

class SearchProfile extends StatelessWidget {
  final roll_no_=TextEditingController();
  final name=TextEditingController();
  final category=TextEditingController();
  final contact1=TextEditingController();
  final contact2=TextEditingController();
  final email=TextEditingController();
  final dues=TextEditingController();

  DatabaseReference DBref=FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            title: Text('Visitor profile'),
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

          body:  SingleChildScrollView(child:Column(
              children: [Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0
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
                    hintText: "Search by membership id",
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.search), onPressed: () async {get_details();
                    await Future.delayed(const Duration(seconds:2));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => Profile(roll_no:roll_no_.text,name:name.text,category:category.text,
                              email:email.text,contact1:contact1.text,contact2:contact2.text,dues:dues.text)),);}),
                    prefixIcon: IconButton(
                        icon: const Icon(Icons.clear), onPressed: () {}),
                  ),
                  controller: roll_no_,),
              ),],),),),);

  }

  get_details() {
    List l=[];
    DBref.once().then((DataSnapshot snapshot) {
      Map m=snapshot.value["Visitor"][roll_no_.text];
      if(m!=null){var i=1;
      l=[];
      m.forEach((k, v) => l.add(v));
      name.text=m['name'];
      category.text=m['category'];
      email.text=m['email'];
      contact1.text=m['contact1'];
      contact2.text=m['contact2'];
      dues.text=m['dues'];
      }


      else{print("Error");}
    });


  }
  }
