import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name - UI
  late String time; // time in the location
  String flag; // flag image - UI
  String url; // the api endpoint url for the location
  late bool isNight;
  // constructor
  WorldTime(this.url, this.flag, this.location);

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/${url}'));

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = now.add(
        Duration(
          hours: int.parse(
            offset.substring(0, 3),
          ),
        ),
      );
      isNight = now.hour > 6 && now.hour < 20 ? false : true;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: ${e}');
      time = "Could not retrive time";
    }
  }
}
