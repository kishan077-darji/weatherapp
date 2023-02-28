import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/screens/location_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoadingScreen(),
        "/home/": (context) => const HomeScreen(),
        "/loading/": (context) => const LoadingScreen(),
        "/location/": (context) => const LocationScreen(),
      },
    ),
  );
}
