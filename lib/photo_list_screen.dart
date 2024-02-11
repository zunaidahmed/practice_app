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

  @override
  void initState() {
    super.initState();
   getPhotoGalleryList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://rabbil.com/files/rabbil.jpg'),
              ),
              title: Text('ABCD'),
            );
          }),
    );

  }

  Future<void> getPhotoGalleryList() async {

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);

    print(response);
    print(response.statusCode);
    print(response.body);




  }
}
