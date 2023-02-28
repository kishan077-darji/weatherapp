import 'dart:convert';
import 'package:http/http.dart';
import 'package:geocoding/geocoding.dart';

class GetData {
  double? longitude;
  double? latitude;
  String? temp;
  String? description;
  String? humidity;
  String? airSpeed;
  String? main;

  GetData({
    required this.latitude,
    required this.longitude,
  });

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=366a86a6a4fd16f37a3566372cb5d78c'));
      Map data = jsonDecode(response.body);

      //Getting temp and humidity
      Map tempData = data['main'];
      double getTemp = tempData['temp'] - 273.15;
      String getHumidity = tempData['humidity'].toStringAsFixed(2);

      //Getting wind speed
      Map wind = data['wind'];
      double getAirspeed = wind['speed'] * 3.6;

      //Getting description
      List getWeatherData = data['weather'];
      Map getWeatherMainData = getWeatherData[0];
      String getMainDesc = getWeatherMainData['main'];
      String getDesc = getWeatherMainData['description'];

      //Asigning a velues
      temp = getTemp.toStringAsFixed(2);
      description = getDesc;
      humidity = getHumidity;
      airSpeed = getAirspeed.toStringAsFixed(2);
      main = getMainDesc;
    } catch (e) {
      print(e);
    }
  }
}
