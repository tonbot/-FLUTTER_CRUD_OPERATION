// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers


import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      
      return Scaffold(
    
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,80.0,20.0,40.0),
          child: Container(
            child: ListView(
              children: 
                [Column(
                    
                  children:  [
                    
                    SizedBox(
                      child: Center(
                          child: Icon(
                            Icons.widgets,
                            size: 60,
                          )
                      ),
                    ),
            
                    SizedBox(
                      height:20 ,
                    ),
            
                    SizedBox(
                      child: Center(
                          child: Text(
                            "PROVIDUSBANK",
                            style:TextStyle(
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                                color:Colors.black87
                              ) ,
                            )
                      ),
                    ),
            
                    SizedBox(
                      child: Center(
                          child: Text(
                            "FUTURE FORWARD BANKING",
                            style: TextStyle(
                                fontSize:10,
                                color:Colors.black,
                                letterSpacing:2.0
            
                            ),
            
                            )
                      ),
                    ),
            
                    SizedBox(
                      height:300 ,
                    ),
            
                    Center(
                        child: GestureDetector(
                          onTap:() {
                               Navigator.pushNamed(context, "/login");
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(130, 20,130, 20),
                            decoration:BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0,3),
                                  )
                                ]
                               
                            ), 
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize:14,
                                fontFamily: "roboto",
                                color:Colors.black
                        
                              ),
                               
                              )
                            ),
                        )
                    ),
                 
            
                     SizedBox(
                      height:30 ,
                    ),
            
                    Center(
                        child: GestureDetector(
                          onTap:() {
                              Navigator.pushReplacementNamed(context, "/register");
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(130, 20,130, 20),
                            decoration:BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0,3),
                                  )
                                ]
                            ), 
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize:14,
                                fontFamily: "roboto",
                                color:Colors.white,
                        
                              ),
                               
                              )
                            ),
                        )
                    ),
                    
                  ],
                    
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}