import 'package:flutter/material.dart';
//import 'package:http/http.dart'as http;
//import 'dart:convert';
import '../services/world_time.dart';
//import 'dart:async';



class Location extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<Location> {

  //String time = 'loading';

   //Future<Data> datareceived;
   void setupWorldTime() async {
      WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
     await instance.getTime();
    //  print(instance.time);
    //  setState(() {
    //    time=instance.time;
    //  });
     
    //  print(instance.time);
    //  print(instance.flag);
    //  print(instance.location);
     

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
    });
     
   }

  @override
void initState(){
  super.initState();
  setupWorldTime();
  //print(datareceived);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        //child: Text(time),
      ),
      
    );
  }
}