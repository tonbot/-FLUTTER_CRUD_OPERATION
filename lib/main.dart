// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_string_interpolations, slash_for_doc_comments

import 'package:demo1/home.dart';
import 'package:demo1/login.dart';
import 'package:demo1/register.dart';
import 'package:demo1/welcome.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
 //   home:home(),
    routes: {
      "/"         :(context)  => home(),
      "/login"    :(context)  => login(),
      "/register" : (context) => register(),
      "/welcome"  : (context)  => welcome(),
    },

  ));
}