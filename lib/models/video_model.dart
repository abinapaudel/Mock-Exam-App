class Video {
  String? title;
  String? description;
  String? thumbnail;
  String? videoid;

  Video({this.description, this.thumbnail, this.title, this.videoid});

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnails']['high']['url'];
    videoid = json['resourceId']['videoId'];
  }
}
