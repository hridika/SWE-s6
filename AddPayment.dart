import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class Addpayment extends StatefulWidget {final roll_no;
Addpayment(this.roll_no);

@override
Addpayment_state createState() => Addpayment_state(this.roll_no);
}

class Addpayment_state extends State<Addpayment> {
  final receipt = TextEditingController();
  final amount = TextEditingController();
  final _text = TextEditingController();
  String date = "Select date";
  String id="";
  DateTime selectedDate = DateTime.now();
  final DBref=FirebaseDatabase.instance.reference();
  final roll_no;
  Addpayment_state(this.roll_no);

  bool receipt_validate = false;
  bool amount_validate = false;

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
              title: Text('Add payment'),
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
                    padding: const EdgeInsets.fromLTRB(20,50,20,20),
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
                        hintText: "Enter receipt no",
                        errorText: receipt_validate ? 'All fields are mandatory' : null,
                      ),
                      controller: receipt,),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                        hintText: "Enter amount",
                        errorText: amount_validate ? 'Enter a valid value' : null,
                      ),
                      controller: amount,),),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,20),
                    child:TextFormField(
                      decoration:InputDecoration(
                        hintText:date,
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
                        suffixIcon:IconButton( icon:const Icon(Icons.calendar_today_outlined),
                            onPressed: () {
                              _selectDate(context);
                            }),
                      ),),),



                  Padding(
                    padding: EdgeInsets.fromLTRB(10,35,10,20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        ),
                        child: const Text("Add payment"),
                        onPressed: () {
                          setState(() {
                            receipt.text.isEmpty ? receipt_validate= true : receipt_validate = false;
                            amount.text.isEmpty ? amount_validate = true : amount_validate = false;


                          });
                          if(receipt_validate==false){
                            final snackBar = SnackBar(
                              content: const Text('Payment added successfully!'),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          addpayment_();
                        }
                    ),),
                ]
            )

        )
    );
  }
  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
    {setState(() {
      date=selected.toString();
      selectedDate = selected;
    });
    print(selectedDate);}
  }
  addpayment_() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var fd = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    var ft = "${dateParse.hour}-${dateParse.minute}";
    DBref.child("Payment").child(roll_no).set({
      'receipt':receipt.text,
      'amount':amount.text,
      'date':fd,
      'membership':roll_no,
    });
    DBref.child("Visitor").child(roll_no).child("Payment").set({
      'receipt':receipt.text,
      'amount':amount.text,
      'date':fd,
      'membership':roll_no,
    });
  }
}