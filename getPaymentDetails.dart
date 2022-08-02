
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/AddPayment.dart';
import 'package:nitc_swe/AddVisit.dart';
import 'package:nitc_swe/home.dart';

class PaymentDetails extends StatefulWidget {

  final roll_no;
  final amount;
  final receipt_no;final date;

  PaymentDetails(
        this.roll_no, this.amount,this.receipt_no,this.date);
  @override
  PaymentDetails_state createState() => PaymentDetails_state(this.roll_no,this.amount,this.receipt_no,this.date);
}

class PaymentDetails_state extends State<PaymentDetails> {
 final roll_no;final date;
  String name;
  String contact1;
  String contact2;
  String email;
  String category;
  String dues;
  String entry="";

  String amount="";
  String receipt_no;
  final DBref=FirebaseDatabase.instance.reference();
  PaymentDetails_state(
      this.roll_no,this.amount,this.receipt_no,this.date)
  ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('Visitor details'),
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

        body: SingleChildScrollView(child:Column(
          children: [Row(children:[
            Padding(
          padding: const EdgeInsets.all(1),
    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
      130,
      30,
    ),),
    onPressed: () {  },
    child: Text('        Membership id      ',style:TextStyle(color:Colors.black)),),),

    Padding(
              padding: const EdgeInsets.all(1),
              child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                130,
                30,
              ),),
        onPressed: () {  },
        child:
              Text(' ${roll_no} ',style:TextStyle(color:Colors.black)),),),],),

            Row(children:[
        Padding(
          padding: const EdgeInsets.all(1),
          child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
    130,
    30,
    ),),
            onPressed: () {  },
            child: Text('         Amount       ',style:TextStyle(color:Colors.black)),),),


            Padding(
              padding: const EdgeInsets.all(1),
              child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
    130,
    30,
    ),),
          onPressed: () {  },
          child:
              Text('  ${amount} ',style:TextStyle(color:Colors.black)),),),],),
          Row(children:[
          Padding(
        padding: const EdgeInsets.all(1),
        child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
          130,
          30,
        ),),
          onPressed: () {  },
          child: Text('         Receipt no      ',style:TextStyle(color:Colors.black)),),),

        Padding(
              padding: const EdgeInsets.all(1),
              child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
    130,
    30,
    ),),
        onPressed: () {  },
        child:
              Text('   ${receipt_no} ',style:TextStyle(color:Colors.black)),),

            ),],)
,Row(children:[
              Padding(
                padding: const EdgeInsets.all(1),
                child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                  130,
                  30,
                ),),
                  onPressed: () {  },
                  child: Text('  Date    ',style:TextStyle(color:Colors.black)),),),

              Padding(
                padding: const EdgeInsets.all(1),
                child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
    130,
    30,
    ),),
                  onPressed: () {  },
                  child:
                  Text('   ${date} ',style:TextStyle(color:Colors.black)),),

              ),],)


          ],),),
      ),);
  }
  _selectentry(BuildContext context) async {
    setState(() {
      entry = DateTime.now().toString();

    });
    DBref.child("Visit").push().set({
      'id':roll_no,
      'entry':entry,
      'date': DateTime.now().toString(),
    });


    print(entry);}
  get_details() {
    List l=[];
print(roll_no);
    DBref.once().then((DataSnapshot snapshot) {
      Map m=snapshot.value["Payment"][roll_no];
print(m);

      if(m!=null){
        l=[];
        m.forEach((k, v) => l.add(v));


        Map m2;
        List l_=[];
        List l1=[];
        List l2=[];
        ;List entry_=[];
        var i=0;
        for (i=0;i<l.length;i++){
          m2=l[i];

          m2.forEach((k,v)=>l_.add(v));

          setState(()  {
            l1.add(l_[1]);

            l2.add(l_[2]);

            l_=[];
          });

        }

        setState(() {




        });}
      else{print("Error");}
      return 1;
    });

  }}
