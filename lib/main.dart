import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :  ( context ) => loading(),
      '/home' : (context) => home(),
       '/location' : (context) => location(),
    },
   ),
 );
}

