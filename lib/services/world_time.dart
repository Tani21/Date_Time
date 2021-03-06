import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // make the request
    final response =
        await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //String part_offset = offset.s
    // print(datetime);
    // print(offset);

    // create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

  isDayTime = now.hour > 6 && now.hour <20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
