import 'package:code_practice_with_flutter/weather_information.dart';
import 'package:flutter/material.dart';

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const WeatherInfoScreen(),
    );
  }
}
