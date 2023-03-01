import 'dart:convert';
import 'package:http/http.dart';

class GetData {
  String? longitude;
  String? latitude;
  String? temp;
  String? description;
  String? humidity;
  String? airSpeed;
  String? main;
  String? icon;
  String? cityName;

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
      String getHumidity = tempData['humidity'].toStringAsFixed(1);

      String getCityName = data['name'];

      //Getting wind speed
      Map wind = data['wind'];
      double getAirspeed = wind['speed'] * 3.6;

      //Getting description
      List getWeatherData = data['weather'];
      Map getWeatherMainData = getWeatherData[0];
      String getMainDesc = getWeatherMainData['main'];
      String getDesc = getWeatherMainData['description'];
      String getIcon = getWeatherMainData['icon'];

      //Asigning a velues
      temp = getTemp.toStringAsFixed(1);
      description = getDesc;
      humidity = getHumidity;
      airSpeed = getAirspeed.toStringAsFixed(1);
      main = getMainDesc;
      icon = getIcon.toString();
      cityName = getCityName;
    } catch (e) {
      temp = "NA";
      description = "NA";
      humidity = "NA";
      airSpeed = "NA";
      main = "NA";
      icon = "04n";
    }
  }
}
