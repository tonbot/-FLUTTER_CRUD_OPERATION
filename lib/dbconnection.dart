

// ignore_for_file: file_names, unused_element, camel_case_types, avoid_print, empty_constructor_bodies, await_only_futures, unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison, slash_for_doc_comments, unrelated_type_equality_checks
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
class dbconnection {


  //this function open and connect to database and return Database value
 static Future<Database> get databaseConnect async{
         WidgetsFlutterBinding.ensureInitialized();
         //getting the path directory
         Directory pat = await getApplicationDocumentsDirectory();
         var realpath = await join(pat.path, "luc.db");
         //open the database
         Database openDb= await openDatabase
              (realpath, 
              version: 1, 
              onCreate: (Database db, int version) 
                        async{
                              await db.execute(
                                            """CREATE TABLE user(
                                              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                                              email TEXT,
                                              password INTEGER, 
                                              created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""",
                                    );
                              // await    db.execute(
                              //               'CREATE TABLE enumration(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
                              //       );
                            });

       //  onUpgrade:  
             return openDb;
          
    }    


    /******************************** check Db********************************************************************* */                
    static  register_user(Database dbconnect, String email, String password) async{

         //convert new user to map
         Map<String, dynamic> map= await {
             "email"     :  email,
             "password" : password,
         };

              //check if user is already registered 
              List<Map<String, dynamic>> check_user =await dbconnect.query('user', where: "email= ?", whereArgs: [email]);
                 
                if(check_user.isNotEmpty){
                   
                   return "user exists"; 

                } else{
                   //insert new user
                   await dbconnect.insert("user", map);
                   return "user registered successfully";
                }

       
          }
/***************************************************************************************************** */ 


    /******************************** check Db********************************************************************* */                
    static login_user(Database dbconnect, String email, String password) async{

              //check if user is already registered 
              List<Map<String, dynamic>> check_user =await dbconnect.rawQuery("""SELECT * FROM user WHERE 
              email='$email' AND password= '$password' """);
                 
                if(check_user.isNotEmpty){
                   
                   return "success"; 

                } else{
                   //insert new user
                 
                   return "failed";
                }

       
          }
/***************************************************************************************************** */ 


/******************************** check Db********************************************************************* */                
      static checkDb(dbconnect) async{
        
             var count = await dbconnect.rawQuery('SELECT * FROM user');
                    print(count);
          }
/***************************************************************************************************** */   

/******************************** check Db********************************************************************* */                
       Future<bool> dbExist() async{
               WidgetsFlutterBinding.ensureInitialized();
                //getting the path directory
                Directory pat = await getApplicationDocumentsDirectory();
                var realpath = await join(pat.path, "myDemoee.db");
                //open the database
                if( await databaseExists(realpath)=="true"){
                      deleteDatabase(realpath);
                      return true;
                }else{
                  return false;
                }

          }
/***************************************************************************************************** */   
/******************************** ********************************************************************* */                
     static Future<String> user_login(String user_email, String user_password) async{
                var url = Uri.parse('https://www.ekitistate.com/api/user_login_api.php');
                //sending data to the server for login confirmation
                var response = await http.post(
                  url,
                 body: {
                       'email'   : user_email, 
                       'password': user_password,
                     }
                     );

                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');

                return response.body.trim();
            
      }
/***************************************************************************************************** */   

  }


