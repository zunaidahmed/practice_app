import 'dart:convert';
import 'package:code_practice_with_flutter/temperature_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Temperatures> weatherInfo = [];
  bool _getPhotoGalleryProgress = false;

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
        visible: _getPhotoGalleryProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: weatherInfo.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(weatherInfo[index].city ?? ' '),
              );
            }),
      ),
    );
  }

  Future<void> getPhotoGalleryList() async {
    _getPhotoGalleryProgress = true;
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
    _getPhotoGalleryProgress = false;
    setState(() {});
  }
}
