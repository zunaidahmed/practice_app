import 'package:code_practice_with_flutter/photo_gallery.dart';
import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget {
  final PhotoGallery photo;

  const PhotoDetails({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(photo.url ?? ''),
              const SizedBox(height: 15),
              Text(
                'Title: ${photo.title ?? ''}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              Text(
                'ID: ${photo.id ?? ''}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
