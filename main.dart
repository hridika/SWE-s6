import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nitc_swe/HomePM.dart';
import 'package:nitc_swe/addmanager.dart';
import 'package:nitc_swe/home.dart';
import 'package:nitc_swe/profile.dart';

void main(){ runApp( MyApp());}

class MyApp extends StatelessWidget {
  MyApp({ key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swimming pool nitc',
      home: MyHomePage(),
      theme:ThemeData(primaryColor: Colors.teal),

    );
  }
}
class AdminLogin extends StatefulWidget{
  const AdminLogin({key}):super(key: key);
  @override
  _AdminLogin createState()=>_AdminLogin();
}
class _AdminLogin extends State<AdminLogin>{
  final username=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({ key}): super(key: key);
  final username=TextEditingController();
  final password =TextEditingController();
  final DBRef =FirebaseDatabase.instance.reference();


  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white ,
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.teal,
          // ignore: prefer_const_constructors
          titleTextStyle: TextStyle(color :Colors.white,fontStyle: FontStyle.normal,fontSize:30,fontWeight:FontWeight.bold,
            shadows:<Shadow>[Shadow(
              offset:Offset(1.0,1.0),
              color: Colors.tealAccent,
            )],
          ),
        ),


        body:SingleChildScrollView(child:

        Padding(
            padding: EdgeInsets.fromLTRB(10, 100, 10,20),
            child:Column(children:<Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(

                  cursorColor:Colors.black ,

                  decoration: InputDecoration( prefixIcon: IconButton(
                      icon: const Icon(Icons.person), onPressed: () {}),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8, color: Theme
                            .of(context)
                            .primaryColor)
                    ),
                    labelText: 'Username',),
                  controller:username   ,

                ),

              ),


              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                child:  TextField(
                  obscureText:true,
                  decoration: InputDecoration(prefixIcon: IconButton(
                      icon: const Icon(Icons.lock), onPressed: () {}),
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
                    labelText: 'Password',),
                  controller:password ,

                ),

              ),

              Container(
                  height: 50,
                  padding:  EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),

                      ),
                      child:  Text('Login'),
                      onPressed: () {int flag=0;var a,b;
    DBRef.once().then((DataSnapshot snapshot) async {
    Map m = snapshot.value["Admin"];await Future.delayed(const Duration(seconds:2));
    print(m);
    m.forEach((k,v){a=k;b=v;
    print(a);
    print(username.text);
    print(b);
    print(password.text);
    if(username.text==a.toString() && password.text==b.toString()){flag=1;
    Navigator.push(
    context,
    MaterialPageRoute(builder:
    (context) => HomeApp()),);
    }});

    if(flag==0){
                          DBRef.once().then((DataSnapshot snapshot) {
                            Map m = snapshot.value["Manager"];
                            print(m);
                            List l = [];
                            List l2 = [];
                            var i;
                            m.forEach((k, v) => l.add(v));
                            for (i = 0; i < l.length; i++) {
                              Map m2 = l[i];
                              print(m2);
                              l2 = [];
                              m2.forEach((key, value) => l2.add(value));

                              if (username.text == m2['id']&&
                                  password.text == m2['password']) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder:
                                      (context) => Homepm()),);
                              }


                              else {
                                final snackBar = SnackBar(
                                  content: const Text(
                                      'Invalid login credentials!'),
                                  action: SnackBarAction(
                                    label: 'Dismiss',
                                    onPressed: () {},
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar);
                              }
                            }
                          });
                        }});})),


              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child:Image.asset(
                  'asset/waves.jpg',
                  width: 600,
                  height: 200,
                  //fit: BoxFit.cover,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomLeft,
                ))],
            ))));
  }
  void writeData(){
    DBRef.child("3").set({
      'id':username.text,
      'password':password.text,
    }
    );}

}








