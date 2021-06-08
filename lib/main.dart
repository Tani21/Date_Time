import 'package:date_and_time/pages/choose_location.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/choose_location.dart';
import './pages/location.dart';
import 'pages/test.dart';


void main() =>
  runApp(MaterialApp(

    initialRoute: '/location',
    routes : 
    {
      '/' : (context) => Location(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(), 
      '/test' : (context) => MyApp(),
    }
  ));

