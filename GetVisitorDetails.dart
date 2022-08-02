import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/AddPayment.dart';
import 'package:nitc_swe/AddVisit.dart';
import 'package:nitc_swe/home.dart';
import 'package:nitc_swe/main.dart';

import 'getPaymentDetails.dart';
import 'getVisitDetails.dart';

class Visitor extends StatefulWidget {

  final roll_no;
  final name;
  final contact1;
  final contact2;
  final email;
  final category;
  final dues;
  final entry;
  final count;
  Visitor(
      {  this.roll_no, this.name, this.category, this.email, this.contact1, this.contact2,this.dues, this.entry, this.count});

  @override
  Visitor_state createState() => Visitor_state(dues: dues, category: category, contact1: contact1, contact2: contact2, name:name , email:email, roll_no:roll_no,count:count);
}

class Visitor_state extends State<Visitor> {
  String roll_no;String count;String datepay;
  String name;
  String contact1;
  String contact2;
  String email;
  String category;
  String dues;
  String entry="";
  String date="";
  String amount="";
  String dues_="";
  String receipt_no="";
  String exit="";
  List l_=[];
  List l1=[];
  List l2=[];
  List l3=[];
  List datelist=[];
  List entrylist=[];
  List exitlist=[];
  final DBref=FirebaseDatabase.instance.reference();
  Visitor_state(
      { key,this.roll_no, this.name,this.category, this.email, this.contact1, this.contact2,this.dues,this.count})
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

        body: SingleChildScrollView(
          child:Column(
            children: [

              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 50, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                      130,
                      30,),),
                      onPressed: () {  },
                      child: Text('Name',style:TextStyle(color:Colors.black)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 50, 1, 0),
                    child:ElevatedButton(
                      child: Text('${name}',style:TextStyle(color:Colors.black)),style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                      225,
                      30,),), onPressed: () {  },),),],),


              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                      130,
                      30,),),
                      onPressed: () {  },
                      child: Text('Membership ID',style:TextStyle(color:Colors.black)),),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1,0,1,0),
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
                      130,
                      30,),),
                      onPressed: () {  },
                      child: Text('No.of visits',style:TextStyle(color:Colors.black)),),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1,0,1,0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                      225,
                      30,),),
                      onPressed: () {  },
                      child:
                      Text('${count} ',style:TextStyle(color:Colors.black)),),),],),



              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                      130,
                      30,),),
                      onPressed: () {  },
                      child: Text('Dues',style:TextStyle(color:Colors.black)),),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                      225,
                      30,),),
                      onPressed: () {  },
                      child: Text('${dues}',style:TextStyle(color:Colors.black)),),),],),


              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.teal[300],fixedSize: const Size(
                      130,
                      30,
                    ),),
                      onPressed: () {  },
                      child: Text('Category',style:TextStyle(color:Colors.black)),),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child:ElevatedButton(style:ElevatedButton.styleFrom(primary:Colors.tealAccent[100],fixedSize: const Size(
                      225,
                      30,),),
                      onPressed: () {  },
                      child:
                      Text('${category}',style:TextStyle(color:Colors.black)),),),],),




              Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 70, 10, 30),

                    child: FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.add_circle_rounded,
                              color: Colors.teal,
                              size:40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "         Add Visit          ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () { _selectentry(context);Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => HomeApp()));
                      },
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 70, 10, 30),
                    child: FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          Image.asset(
                            'asset/OIP.jpg',
                            width: 44,
                            height: 44,
                            //fit: BoxFit.cover,
                          ),



                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "        Add payment     ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => Addpayment(roll_no)),);
                      },
                    ),),],),
              Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(7.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.info_rounded,
                              color: Colors.blue,
                              size:40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "          Get visit details   ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {get_details();
                      await Future.delayed(const Duration(seconds:2));Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => VisitDetails(datelist,entrylist,exitlist)),);

                      },
                    ),),


                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child:
                              Icon(
                                Icons.money,
                                color: Colors.teal,
                                size:40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Get payment details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () async  {get_details_pay();
                        await Future.delayed(const Duration(seconds:2));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => PaymentDetails( roll_no,amount,receipt_no,datepay)),);
                        }
                    ),),],),],),),),);
  }
  _selectentry(BuildContext context) async {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var fd = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  var ft = "${dateParse.hour}-${dateParse.minute}";
  // som
    setState(() {
      entry = DateTime.now().toString();

    });
    DBref.child("Visitor").child(roll_no).child("Visit").child(ft).set({
      'id':roll_no,
      'entry':ft,
      'date': fd,
      'count':count,
      'exit':exit,
    });
    DBref.child("Visit").push().set({
      'id':roll_no,
      'entry':ft,
      'date': fd,
      'exit':exit,
    });
    DBref.child("Entry").child(roll_no).set({
      'id':roll_no,
    });
    DBref.once().then((DataSnapshot snapshot) {
      var m = snapshot.value["Visitor"][roll_no]["count"];
      int count=int.parse(m);
    print(count);
    count=count+1;
    var check=snapshot.value["Visitor"][roll_no]["category"];
    if(check=="student" && count>5)
      DBref.child("Visitor").child(roll_no).update({"dues":"200"});
      var check2=snapshot.value["Payment"];
      print(check2);
    print(count);
      DBref.child("Visitor").child(roll_no).update({"count":count.toString()});



    print(entry);});}
  get_details() {Map m;
  List l=[];datelist=[];entrylist=[];exitlist=[];
  DBref.once().then((DataSnapshot snapshot) {
    Map m = snapshot.value["Visitor"][roll_no]["Visit"];
Map m2;
    if (m != null) {
      l = [];
      m.forEach((k, v) => l.add(v));

      print(l);
      for (var i=0;i<l.length;i++){
        Map m2=l[i];
        datelist.add(m2['date']);
        entrylist.add(m2['entry']);
        exitlist.add(m2['exit']);

      }
      print(datelist);
      print(entrylist);
      print(exitlist);
    }
  });
  }get_details_pay() {
    List l=[];
    print(roll_no);
    DBref.once().then((DataSnapshot snapshot) {
      Map m=snapshot.value["Payment"][roll_no];


      if(m!=null) {
        amount = m['amount'];
        receipt_no = m['receipt'];
        datepay=m['date'];
      }


      else{print("Error");}
      return 1;
    });

  }}



