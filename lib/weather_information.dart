import 'dart:convert';
import 'package:code_practice_with_flutter/temperature_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  List<Temperatures> weatherInfo = [];
  bool _getWeatherInfoScreenProgress = false;

  @override
  void initState() {
    super.initState();
    getPhotoGalleryList();  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: Visibility(
        visible: _getWeatherInfoScreenProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.separated(
            itemCount: weatherInfo.length,
            itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City: ${weatherInfo[index].city ??  ''}'),
                    Text(weatherInfo[index].temperature?.toString() ?? ''),
                    Text(weatherInfo[index].condition ?? ''),
                    Text(weatherInfo[index].humidity ?.toString() ?? ''),
                    Text(weatherInfo[index].windSpeed?.toString() ?? ''),
                  ],

                ),
             );

             
            }, separatorBuilder: (BuildContext context, int index) {

          return const Divider();

        },),
      ),
    );
  }

  Future<void> getPhotoGalleryList() async {
    _getWeatherInfoScreenProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://raw.githubusercontent.com/zunaidahmed/practice_app/weather_info/weather_info.txt');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      var decodePhoto = jsonDecode(response.body);
      for (var item in decodePhoto) {
        Temperatures temperatures = Temperatures.fromJson(item);
        weatherInfo.add(temperatures);
      }
    }
    _getWeatherInfoScreenProgress = false;
    setState(() {});
  }
}
