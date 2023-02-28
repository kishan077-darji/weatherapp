import 'package:flutter/material.dart';
import 'package:weather/getdata/get_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? temp;
  String? humidity;
  String? main;
  String? description;
  String? airSpeed;

  void startApp() async {
    GetData instance = GetData(latitude: 23.0225, longitude: 72.5797);
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    main = instance.main;
    description = instance.description;
    airSpeed = instance.airSpeed;
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home/", arguments: {
        "tempValue": temp,
        "descValue": description,
        "mainValue": main,
        "airSpeedValue": airSpeed,
        "humidityValue": humidity,
      });
    });
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/weather.png"),
            const Text(
              "Weather app",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Made by Kishan",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    ));
  }
}
