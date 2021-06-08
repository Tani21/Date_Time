import 'package:date_and_time/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  static String flagg = "";
  static String timee = "";
  static String locationn = "";
  static bool isDayTimee = true;

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'assets/uk.png'),
    WorldTime(
        url: 'Europe/Berlin', location: 'Athens', flag: 'assets/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    //WorldTime(url: 'Aisa/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    // {
    //   'flag': instance.flag,
    //   'time': instance.time,
    //   'location':instance.location,
    //   'isDayTime': instance.isDayTime,
    // }
    ChooseLocation.flagg = instance.flag;
    ChooseLocation.timee = instance.time;
    ChooseLocation.locationn = instance.location;
    ChooseLocation.isDayTimee = instance.isDayTime;

    print('flag: ${ChooseLocation.flagg}');
    print('time: ${ChooseLocation.timee}');
    print('location: ${ChooseLocation.locationn}');
    print('isDayTime: ${ChooseLocation.isDayTimee}');

    await Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a location'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }));
  }
}
