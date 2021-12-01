// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_string_interpolations, slash_for_doc_comments

import 'package:demo1/welcome.dart';
import 'package:flutter/material.dart';
import 'package:demo1/dbconnection.dart';
import 'package:sqflite/sqlite_api.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _demoState createState() => _demoState();
}

// ignore: camel_case_types
class _demoState extends State<login> 
{

  /********************************************** variable declaration **************************************************/
      String error_tex="";
      TextEditingController      email    = TextEditingController();
      TextEditingController      password = TextEditingController();
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      email.dispose();
      password.dispose();
      super.dispose();
    }

        return SafeArea(
          child: Scaffold(
          //app bar container widget
          appBar: AppBar(
            title: const Text("Login page"),
            backgroundColor: Colors.black87,
            centerTitle: true,
            elevation: 0.0,
          ),
          //body container
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: 
                  [Column
                  (
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 60.0,
                      ),
                      Center(
                        child: const Text(
                          "Please Login your account here",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                   
                        Text( error_tex, ), //space
                      SizedBox(height: 40.0), //space
                        
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.supervisor_account_sharp,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Username"),
                          ],
                        ),
                      ),
                        
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            hintText: "username",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            )),
                        validator: (email_value) {
                          if (email_value == "" || email_value == null) {
                            return "username field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                        
                             
                        
                      SizedBox(height: 20.0), //space
                        
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: const <Widget>[
                              Icon(                                                                                                                                                                                          
                                Icons.lock,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("Password"),
                            ],
                          )),
                        
                      SizedBox(height: 5.0),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: "password",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            )),
                        obscureText: true,
                        validator: (password_value) {
                          if (password_value == "" || password_value == null) {
                            return "password field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                        
                      /******************* button container start here ******************************************************/
                      SizedBox(
                        height: 20.0,
                      ),
                        
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            final validated = _formKey.currentState!.validate();
                            if (validated)  {
                                   
                             
                       
                                   String user_email    = email.text.trim();
                                   String user_password = password.text.trim();
                                   //make a connection to the Database
                                  //  Database dbconnect =await dbconnection.databaseConnect;
                                   //perform query
                                   String response= await dbconnection.user_login(user_email,user_password);
                                    //String response= await dbconnection.login_user(dbconnect, user_email, user_password);
                                    print(response);
                                        setState(() {
                                            if( response=="success"){
                                                   Navigator.pushReplacementNamed(context, "/welcome", arguments: {
                                                     "user":user_email,
                                                   });
                                            }else{
                                                   error_tex="NO ACCOUNT FOUND";
                                            }
                                                 
                                      
                                        });
                            } else {
                          
                              print("not correct");
                          
                           
                            }
                                  
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.amber[900],
                            ),
                            child: SizedBox(
                             // height:80,
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /******************* button container ends  here ******************************************************/
                    ],
                  ),
                ],
              ),
              
            ),
          ),
              ),
        );
   
  }
}
