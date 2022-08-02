import 'package:flutter/material.dart';
import 'package:nitc_swe/GetVisitorDetails.dart';
import 'package:nitc_swe/home.dart';
import 'package:nitc_swe/selectdate.dart';

class DailyReport extends StatelessWidget {
  DailyReport({ key}) : super(key: key);
  final roll_no=TextEditingController();
 String date="Select the date";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('Daily Report'),
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
            Padding(
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
                      icon: const Icon(Icons.search), onPressed: () {}),
                  prefixIcon: IconButton(
                      icon: const Icon(Icons.clear), onPressed: () {}),
                ),
                controller: roll_no,),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: ElevatedButton(child:const Text( "Get visitor details"),
                  onPressed:(){ Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => Selectdate()),);}
              ),),


          ],),
      ),);}

  get_details() {
    if(roll_no.text=="B190464CS"){
      print(5);

    }
  }}