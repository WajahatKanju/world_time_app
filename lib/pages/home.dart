import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    String imageLocation = data['isNight'] ? "night.jpg" : "day.jpg";

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${imageLocation}"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'falg': result['falg'],
                      'location': result['location'],
                      'isNight': result['isNight']
                    };
                  });
                },
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data['location']}",
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "${data['time']}",
                style: TextStyle(fontSize: 66, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
