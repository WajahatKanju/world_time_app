import 'package:flutter/material.dart';
import 'package:timer/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Asia/Karachi', 'pakistan.png', 'Karachi'),
    WorldTime('Europe/London', 'uk.png', 'London'),
    WorldTime('Europe/Berlin', 'germany.png', 'Berlin'),
    WorldTime('Africa/Cairo', 'egypt.png', 'Cairo'),
    WorldTime('Asia/Tokyo', 'japan.png', 'Tokyo'),
    WorldTime('America/New_York', 'usa.png', 'New York'),
    WorldTime('America/Chicago', 'usa.png', 'Chicago'),
    WorldTime('America/Swift_Current', 'usa.png', 'Swift zCurrent'),
    WorldTime('Australia/Sydney', 'australia.png', 'Sydney'),
    WorldTime('America/Toronto', 'canada.png', 'Toronto'),
    WorldTime('Europe/Paris', 'france.png', 'Paris'),
    WorldTime('Asia/Shanghai', 'china.png', 'Shanghai'),
    WorldTime('America/Sao_Paulo', 'brazil.png', 'São Paulo'),
    WorldTime('Africa/Johannesburg', 'south_africa.png', 'Johannesburg'),
    WorldTime('Asia/Dubai', 'uae.png', 'Dubai'),
    WorldTime('Asia/Singapore', 'singapore.png', 'Singapore'),
    WorldTime('Europe/Moscow', 'russia.png', 'Moscow'),
    WorldTime('Europe/Rome', 'italy.png', 'Rome'),
    WorldTime('Europe/Madrid', 'spain.png', 'Madrid'),
    WorldTime('Europe/Amsterdam', 'netherlands.png', 'Amsterdam'),
    WorldTime('Asia/Seoul', 'south_korea.png', 'Seoul'),
    WorldTime('America/Mexico_City', 'mexico.png', 'Mexico City'),
    WorldTime('Europe/Athens', 'greece.png', 'Athens'),
    WorldTime('Africa/Nairobi', 'kenya.png', 'Nairobi'),
    WorldTime('Asia/Bangkok', 'thailand.png', 'Bangkok'),
    WorldTime('Europe/Istanbul', 'turkey.png', 'Istanbul'),
    WorldTime('Asia/Manila', 'philippines.png', 'Manila'),
    WorldTime('America/Buenos_Aires', 'argentina.png', 'Buenos Aires'),
    WorldTime('Asia/Jakarta', 'indonesia.png', 'Jakarta'),
    WorldTime('Europe/Stockholm', 'sweden.png', 'Stockholm'),
    WorldTime('Europe/Zurich', 'switzerland.png', 'Zurich'),
    WorldTime('Asia/Kuala_Lumpur', 'malaysia.png', 'Kuala Lumpur'),
    WorldTime('Africa/Lagos', 'nigeria.png', 'Lagos'),
    WorldTime('America/Lima', 'peru.png', 'Lima'),
    WorldTime('Europe/Warsaw', 'poland.png', 'Warsaw')
  ];

  void updateTime(index) async {
    WorldTime instance = WorldTime(
      locations[index].url,
      'assets/countries/${locations[index].flag}',
      locations[index].location,
    );
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isNight': instance.isNight,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Choose A Location",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/countries/${locations[index].flag}"),
                    ),
                    title: Text(locations[index].location),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
