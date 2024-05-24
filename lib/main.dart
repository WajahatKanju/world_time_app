import 'package:flutter/material.dart';
import 'package:timer/pages/choose_location.dart';
import 'package:timer/pages/home.dart';
import 'package:timer/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomeScreen(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
