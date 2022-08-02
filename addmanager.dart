import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nitc_swe/addvisitor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nitc_swe/home.dart';

class Addmanager extends StatefulWidget {
Addmanager({ key}) : super(key: key);

@override
Addmanager_state createState() => Addmanager_state();
}


class Addmanager_state extends State<Addmanager> {


final DBref=FirebaseDatabase.instance.reference();

final name=TextEditingController();
final userid=TextEditingController();
final email=TextEditingController();
final password=TextEditingController();
final contact1=TextEditingController();
final contact2=TextEditingController();

final _text = TextEditingController();

bool name_validate = false;
bool userid_validate = false;
bool email_validate = false;
bool password_validate = false;
bool contact1_validate = false;
bool contact2_validate = false;



@override
void dispose() {
_text.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return SafeArea(
child: Scaffold(

appBar: AppBar(
title: Text('Add manager'),
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

body: SingleChildScrollView(
child:Column(
children: [
Padding(
padding: const EdgeInsets.fromLTRB(20,30,20,20),
child: TextField(
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "Name",
errorText: name_validate ? 'All fields are mandatory' : null,

),
controller: name,),
),

Padding(
padding: const EdgeInsets.fromLTRB(20,0,20,20),
child: TextField(
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "User ID",
errorText: userid_validate ? 'All fields are mandatory' : null,

),
controller: userid,),),

Padding(
padding: const EdgeInsets.fromLTRB(20,0,20,20),
child: TextField(
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "Email",
errorText: email_validate ? 'All fields are mandatory' : null,

),
controller: email,),),

Padding(
padding: const EdgeInsets.fromLTRB(20,0,20,20),
child: TextField(
obscureText: true,
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "Password",
errorText: password_validate ? 'All fields are mandatory' : null,

),
controller: password,),),

Padding(
padding: const EdgeInsets.fromLTRB(20,0,20,20),
child: TextField(
keyboardType: TextInputType.number,
inputFormatters: <TextInputFormatter>[
LengthLimitingTextInputFormatter(10),
FilteringTextInputFormatter.digitsOnly
],
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "Contact1",
errorText: contact1_validate ? 'All fields are mandatory' : null,

),
controller: contact1,),),

Padding(
padding: const EdgeInsets.fromLTRB(20,0,20,20),
child: TextField(
keyboardType: TextInputType.number,
inputFormatters: <TextInputFormatter>[
LengthLimitingTextInputFormatter(10),
FilteringTextInputFormatter.digitsOnly
],
decoration: InputDecoration(
contentPadding: const EdgeInsets.all(5
),
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: const BorderSide(width: 0.8)
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(width: 0.8, color: Theme
    .of(context)
    .primaryColor)
),
hintText: "Contact2",
errorText: contact2_validate ? 'All fields are mandatory' : null,

),
controller: contact2,),),
Padding(
padding: EdgeInsets.fromLTRB(10,35,10,20),
child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary: Colors.teal,
padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
),
child:const Text( "Add manager"),
onPressed:() {
  setState(() {
    name.text.isEmpty ? name_validate = true : name_validate = false;
    userid.text.isEmpty ? userid_validate = true : userid_validate = false;
    email.text.isEmpty ? email_validate = true : email_validate = false;
    password.text.isEmpty ? password_validate = true : password_validate =
    false;
    contact1.text.isEmpty ? contact1_validate = true : contact1_validate =
    false;
    contact2.text.isEmpty ? contact2_validate = true : contact2_validate =
    false;
  });


   final snackBar = SnackBar(
    content: const Text('Successfully added'),
    action: SnackBarAction(
      label: 'Dismiss',

    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  addmanager_();}))]))));}


addmanager_() {
DBref.child("Manager").child(userid.text).set({
'id':userid.text,
'name':name.text,
'password':password.text,
'contact1':contact1.text,
'contact2':contact2.text,
'email':email.text,
});
}
}
