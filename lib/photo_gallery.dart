class PhotoGallery {

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoGallery ( {
    this.albumId,
    this.title,
    this.id,
    this.url,
    this.thumbnailUrl

  });

  PhotoGallery.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id =  json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
    
  }
}