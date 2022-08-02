import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Selectdate extends StatefulWidget {
  const Selectdate({ key}) : super(key: key);

  @override
  Selectdate_state createState() => Selectdate_state();
}

class Selectdate_state extends State<Selectdate> {
  final receipt = TextEditingController();
  final amount = TextEditingController();
  String date = "Select the date";
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            appBar: AppBar(
              title: Text('Daily report'),
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
                    padding: EdgeInsets.all(5),
                    child:TextField(
                      decoration:InputDecoration(
                        hintText:date,
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
                        suffixIcon:IconButton( icon:const Icon(Icons.calendar_today_outlined),
                            onPressed: () {
                              _selectDate(context);

                            }),

                      ),),),




                  Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(child: const Text("Go"),style:ElevatedButton.styleFrom(primary:Colors.teal),
                        onPressed: () {}
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
      selectedDate = selected;
      date=selected.toString();
    });
    print(selectedDate);}
  }
}



