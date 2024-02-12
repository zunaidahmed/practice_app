import 'dart:convert';
import 'package:code_practice_with_flutter/photo_details.dart';
import 'package:code_practice_with_flutter/photo_gallery.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<PhotoGallery> galleryList = [];
  bool _getPhotoGalleryProgress = false;

  @override
  void initState() {
    super.initState();
    getPhotoGalleryList();  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: Visibility(
        visible: _getPhotoGalleryProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: galleryList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(galleryList[index].thumbnailUrl ?? ''),
                ),
                title: Text(galleryList[index].title ?? ' '),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoDetails(photo: galleryList[index])));
                },
              );
            }),
      ),
    );
  }

  Future<void> getPhotoGalleryList() async {
    _getPhotoGalleryProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      var decodePhoto = jsonDecode(response.body);
      for (var item in decodePhoto) {
        PhotoGallery photoGallery = PhotoGallery.fromJson(item);
        galleryList.add(photoGallery);
      }
    }
    _getPhotoGalleryProgress = false;
    setState(() {});
  }
}
