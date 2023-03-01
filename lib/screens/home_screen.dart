import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchLatitudeController = TextEditingController();
  TextEditingController searchLongitudeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    String temp = info!['tempValue'];
    String humidity = info['humidityValue'];
    String windSpeed = info['airSpeedValue'];
    String icon = info['iconValue'];
    String desc = info['descValue'];
    String cityName = info['cityValue'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue[400],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.black54,
                gradient: LinearGradient(colors: [
              Colors.blue[300]!,
              Colors.blue[800]!,
            ])),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: searchLatitudeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "Latitude",
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: searchLongitudeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "Longitude",
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if ((searchLatitudeController.text)
                                      .replaceAll(" ", "") ==
                                  "" ||
                              (searchLongitudeController.text)
                                      .replaceAll(" ", "") ==
                                  "") {
                            // ignore: avoid_print
                            print("Blank dearch");
                          } else {
                            Navigator.pushReplacementNamed(context, '/loading/',
                                arguments: {
                                  "searchLatitude":
                                      searchLatitudeController.text,
                                  "searchLongitude":
                                      searchLongitudeController.text,
                                });
                          }
                        },
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/$icon@2x.png"),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "$desc in $cityName",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 250,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  WeatherIcons.thermometer,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "Temprature",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: const TextStyle(fontSize: 70),
                                ),
                                const Text(
                                  "c",
                                  style: TextStyle(fontSize: 60),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  WeatherIcons.humidity,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.0, vertical: 8.0),
                                  child: Text(
                                    "Humidity",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$humidity%",
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  WeatherIcons.day_cloudy_windy,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 8.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "Wind Speed",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      "$windSpeed km/h",
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(children: const [
                    Text(
                      "Made By Kishan",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Data Provided By Openweather.org",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
