import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/video_model.dart';

class VideoServices {
  static const baseUrl = "www.googleapis.com";

  getVideos() async {
    Uri uri = Uri.https(
      baseUrl,
      '/youtube/v3/playlistItems',
      {
        'key': 'AIzaSyDBedjIiXjalN5XtNEyhsxrxeP5OVXt7LA',
        'playlistId': 'PLPZlzC1IStZDOb3ZWG122vZHZI4Pp7MbN',
        'part': 'snippet',
        // 'channelId': 'UCGbxFHiR_Y7yYFX2uOnz7VA',
        'maxResults': '50',

        // PL8b9sg4hu65r-swTCRSc70p7cexP9PLH0
      },
    );

    var response = await http.get(uri);

    if (response.statusCode == 200) {

      var data = jsonDecode(response.body);
      print("data is $data");
      

      

      return List<Video>.from(
        data['items'].map((item) {
          return Video.fromJson(item['snippet']);
        }),
      );
      // print(data);
    } else {
      print(response.statusCode);
    }
  }
}
