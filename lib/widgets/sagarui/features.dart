
import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  final String? image;
  final String? name;
  final Widget? pageName;
  const FeatureCard({super.key, this.image, this.name, this.pageName});

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return widget.pageName!;
                },
              ));
            },
            child: Container(
              height: hh * 0.19,
              width: ww * 0.40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(widget.image!)),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Text(
            widget.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "sofia"),
          )
        ],
      ),
    );
  }
}
