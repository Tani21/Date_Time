import 'package:flutter/material.dart';
//import 'package:http/http.dart'as http;
//import 'dart:convert';
import '../services/world_time.dart';
//import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Location extends StatefulWidget {
  static String loc1 = '';
  static String flag1 = "";
  static String time1 = "";
  static bool yesNo=true;
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<Location> {
  //String time = 'loading';

  //Future<Data> datareceived;
  void setupWorldTime() async {
    WorldTime instance = await WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //  print(instance.time);
    //  setState(() {
    //    time=instance.time;
    //  });

    Location.time1 = instance.time;
    Location.flag1 = instance.flag;
    Location.loc1 = instance.location;
    Location.yesNo = instance.isDayTime;

    // print("time ${instance.time}");
    // print("flag ${instance.flag}");
    // print(instance.location);

    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': instance.location,
    //   'flag': instance.flag,
    //   'time': instance.time,
    // });
    await Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print(datareceived);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
         child:  SpinKitFadingCube(
           color: Colors.white,
           size:80.0,
         ),
  
      ),
    );
  
  }
}
