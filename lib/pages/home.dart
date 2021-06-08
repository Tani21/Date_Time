import 'package:date_and_time/pages/choose_location.dart';
import 'package:date_and_time/pages/location.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Map data = {};
  var loc = "";
  var flag = "";
  var time = "";
  var isDayTime = true;
  var bgImage = "";

  var loctwo = "";
  var flagtwo = "";
  var timetwo = "";
  var isDayTimeTwo = true;
  //var bgColor="";

  @override
  void initState() {
    loc = Location.loc1;
    flag = Location.flag1;
    time = Location.time1;
    isDayTime = Location.yesNo;
    bgImage = isDayTime ? 'assets/day.png' : 'assets/night.png';

    loctwo = ChooseLocation.locationn;
    flagtwo = ChooseLocation.flagg;
    timetwo = ChooseLocation.timee;
    isDayTimeTwo = ChooseLocation.isDayTimee;
    //Color bgColor = isDayTime ? Colors.blue : Colors.indigo;

    print('loc: $loc');
    print('flag: $flag');
    print('time: $time');
    print('isDayTime: $isDayTime');
    //
    print('................................');
    print('loctwo: $loctwo');
    print('flagtwo: $flagtwo');
    print('timetwo: $timetwo');
    print('isDayTimeTwo: $isDayTimeTwo');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loc = loc == loctwo ? loc : loctwo;
    flag = flag == flagtwo ? flag : flagtwo;
    time = time == timetwo ? time : timetwo;
    isDayTime = isDayTime == isDayTimeTwo ? isDayTime : isDayTimeTwo;
    //data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // print("data $data");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: <Widget>[
                FloatingActionButton.extended(
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/location');
                    setState(() {
                      time = timetwo;
                      loc = loctwo;
                      isDayTime = isDayTimeTwo;
                      flag = flagtwo;
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$loc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '$time',
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
