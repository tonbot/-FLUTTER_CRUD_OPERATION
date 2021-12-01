
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class welcome extends StatefulWidget {

  const welcome({ Key? key }) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
 var greetings ;

  @override
  Widget build(BuildContext context) {
    greetings = ModalRoute.of(context)!.settings.arguments;
    print(greetings["user"]);
   
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black87,
        title: Text(greetings["user"]),
        //color:Colors.white,
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: SizedBox(
          child: Text(
             "WELCOME BACK",
             style: TextStyle(
               fontSize: 30,
               fontWeight:FontWeight.bold,
               color: Colors.black,

             ),
          ),
        ),
      ),
    );
  }
}