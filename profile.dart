import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class Profile extends StatelessWidget {
  final roll_no_=TextEditingController();
  String name="";
  String roll_no="";
  String contact1="";
  String contact2="";
  String email="";
  String category="";
  String dues="";
  DatabaseReference DBref=FirebaseDatabase.instance.reference();
  Profile(
      { key,this.roll_no,this.name,this.category,this.email, this.contact1, this.contact2, this.dues})
      : super(key: key);
  @override




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

          body:  SingleChildScrollView(
              child:Column(
                  children: [
                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 50, 1, 0),
                          child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                            160,
                            30,),),
                            onPressed: () {  },
                            child: Text('Name',style:TextStyle(color:Colors.black)),),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 50, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                              225,
                              30,),),
                            onPressed: () {  },
                            child:
                            Text('${name} ',style:TextStyle(color:Colors.black)),),),],),


                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                              160,
                              30,),),
                            onPressed: () {  },
                            child: Text('Membership ID',style:TextStyle(color:Colors.black)),),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                            225,
                            30,),),
                            onPressed: () {  },
                            child:
                            Text('${roll_no} ',style:TextStyle(color:Colors.black)),),),],),


                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                            160,
                            30,),),
                            onPressed: () {  },
                            child: Text('Contact1',style:TextStyle(color:Colors.black)),),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                              225,
                              30,),),
                            onPressed: () {  },
                            child:
                            Text('${contact1} ',style:TextStyle(color:Colors.black)),),),],
                    ),


                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                              160,
                              30,),),
                            onPressed: () {  },
                            child: Text('Contact2',style:TextStyle(color:Colors.black)),),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                              225,
                              30,),),
                            onPressed: () {  },child:
                          Text('${contact2} ',style:TextStyle(color:Colors.black)),),),],),


                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                              160,
                              30,),),
                            onPressed: () {  },
                            child: Text('Email',style:TextStyle(color:Colors.black)),),),
                        Padding(
                            padding: const EdgeInsets.all(1),
                            child:ElevatedButton(
                              style:ElevatedButton.styleFrom(primary: Colors.tealAccent[100],fixedSize: const Size(
                                225,
                                30,),),
                              onPressed: () {  },
                              child: Text('${email} ',style:TextStyle(color:Colors.black)),)
                        ),],),


                    Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                              160,
                              30,),),
                            onPressed: () {  },
                            child: Text('Category',style:TextStyle(color:Colors.black)),),),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                            child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                              225,
                              30,),),
                              onPressed: () {  },
                              child:
                              Text('${category} ',style:TextStyle(color:Colors.black)),)
                        ),],),



                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                      child: ElevatedButton(child: const Text("Edit"),style:ElevatedButton.styleFrom(primary:Colors.teal),
                          onPressed: () {}//Navigator.push(
                           // context,

                           // MaterialPageRoute(builder:
                              //  (context) => EditProfile(name,roll_no,contact1,contact2,email)),);}
                      ,),),
                  ]
              )

          ),)
    );
  }
  get_details() {
    List l=[];
    DBref.once().then((DataSnapshot snapshot) {
      Map m=snapshot.value["Visitor"][roll_no_.text];
      if(m!=null){var i=1;
      l=[];
      m.forEach((k, v) => l.add(v));
      name=m['name'];
      category=m['category'];
      email=l[2];
      contact1=l[4];
      contact2=l[3];
      dues=l[6];
      }


      else{print("Error");}
    });


  }
}