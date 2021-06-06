import 'package:date_and_time/pages/location.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data = {};
  var loc = "";
  var flag = "";
  var time = "";
  @override
  void initState() {
    loc = Location.loc1;
    flag = Location.flag1;
    time = Location.time1;

    print('loc: $loc');
    print('flag: $flag');
    print('time: $time');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context).settings.arguments;
    // print("data $data");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.edit_location),
              label: const Text('Edit location'),
            )
          ],
        ),
      ),
    );
  }
}
