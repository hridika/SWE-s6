import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Addvisitor extends StatefulWidget {
  const Addvisitor({key}) : super(key: key);

  @override
  Addvisitor_state createState() => Addvisitor_state();
}


class Addvisitor_state extends State<Addvisitor> {


  final membershipid=TextEditingController();
  final name=TextEditingController();
  final email=TextEditingController();
  final contact1=TextEditingController();
  final contact2=TextEditingController();
  final category=TextEditingController();
int count=0;

  final DBref=FirebaseDatabase.instance.reference();

  //final _formKey = GlobalKey<FormState>();

  final _text = TextEditingController();
  bool membershipid_validate = false;
  bool name_validate = false;
  bool email_validate = false;
  bool contact1_validate = false;
  bool contact2_validate = false;
  bool category_validate = false;
  bool phno_validate = false;


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
              title: Text('Add visitor'),
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


            body:SingleChildScrollView(
                child:Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,30,20,20),
                        child: TextField(

                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10
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
                            hintText: "Membership ID",
                            errorText: membershipid_validate ? 'All fields are mandatory' : null,

                          ),
                          controller: membershipid,),),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,20),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10
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
                          controller: name,),),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10
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
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0
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
                        child:
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10
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
                          controller: contact2,
                          validator:(value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },),),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,20),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.all(0),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "Category",
                                errorText: category_validate ? 'All fields are mandatory' : null,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(width: 0.8)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(width: 0.8, color: Theme
                                        .of(context)
                                        .primaryColor)
                                ),),
                              onChanged: (newValue) => setState(() {
                                category.text=newValue.toString();
                              }),
                              //value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Student'),
                                  value: 'student',
                                ),
                                DropdownMenuItem(
                                  child: Text('Faculty'),
                                  value: 'faculty',
                                ),
                              ],
                            ),
                          ),
                        ),),



                      // controller: category,),),


                      Padding(
                        padding: EdgeInsets.fromLTRB(20,20,20,20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                            ),
                            child:const Text( "Add visitor"),
                            onPressed:(){List l=[];int a=check(membershipid.text); DBref.once().then((DataSnapshot snapshot) async {
    Map m=snapshot.value["Member"];
    m.forEach((k,v)=>l.add(k));
    print(l);
    if(l.contains(membershipid.text))
    { final snackBar = SnackBar(
    content: const Text("Membership id already exists"),
    action: SnackBarAction(
    label: 'Dismiss',
    onPressed: () {
    },
    ),
    ); ScaffoldMessenger.of(context).showSnackBar(
    snackBar);}else{
                            print(a);
                            setState(() {
                              membershipid.text.isEmpty ? membershipid_validate= true : membershipid_validate = false;
                              name.text.isEmpty ? name_validate = true : name_validate = false;
                              email.text.isEmpty ? email_validate = true : email_validate = false;
                              contact1.text.isEmpty ? contact1_validate = true : contact1_validate = false;
                              contact2.text.isEmpty ? contact2_validate = true : contact2_validate = false;
                              category.text.isEmpty ? category_validate = true : category_validate = false;

                              if(contact1.text.length !=10){
                                final snackBar = SnackBar(
                                  content: const Text('Invalid phno'),
                                  action: SnackBarAction(
                                    label: 'Dismiss',
                                    onPressed: () {
                                    },
                                  ),
                                );

                              }



                            });

                            final snackBar = SnackBar(
                              content: const Text('Successfully added'),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);


                            addvisitor_();
                            print("Membership id exists");}});}))]



    ))));
  }
int check(String b){List l=[];List l2=[];var i;
  DBref.once().then((DataSnapshot snapshot){
    Map m=snapshot.value["Member"];
    print(m);
    m.forEach((k, v) => l.add(v));
    print(l);
    for(i=0;i<l.length;i++)
      {Map m2=l[i];
      m2.forEach((k,v) =>l2.add(v));
      print(l2);
      for(var j=0;j<l2.length;j++){
        print(l2[j]);
        if(j==b){print("eq");
          return 0;}

      }
      }
return 1;});}
  addvisitor_() {var d;List l=[];
  if(membershipid.text!=""){
    if( category.text=="faculty")
       d="500";
    else
      d="0";
    DBref.child("Visitor").child(membershipid.text).set({
      'id':membershipid.text,
      'name':name.text,
      'category':category.text,
      'contact1':contact1.text,
      'contact2':contact2.text,
      'email':email.text,
      'dues':d,
      'count':"0",

    });
    DBref.child("Member").child(membershipid.text).set({
'id':membershipid.text,
    });
  }}
}
