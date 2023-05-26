import 'package:api_with_provider/services/video-services.dart';
import 'package:api_with_provider/widgets/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/video_model.dart';

class VideoHome extends StatefulWidget {
  const VideoHome({Key? key}) : super(key: key);

  @override
  State<VideoHome> createState() => _VideoHomeState();
}

class _VideoHomeState extends State<VideoHome> {
  List<Video> videolist = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();

    VideoServices().getVideos().then((videolist) {
      setState(() {
        this.videolist = videolist;
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(child: CustomAppBar(text: "Videos")),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemCount: videolist.length,
                      itemBuilder: ((context, index) => Card(
                              child: ListTile(
                            title: Text(
                              videolist[index].title!,
                              style: const TextStyle(fontFamily: "Sofia"),
                            ),
                            // subtitle: Text(videolist[index].videoid!),
                            leading: Image.network(
                              videolist[index].thumbnail!,
                              // fit: BoxFit.contain,
                            ),
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "https://www.youtube.com/watch?v=${videolist[index].videoid}"));
                            },
                          ))),
                    ),
                  )
                ],
              ));
  }
}
