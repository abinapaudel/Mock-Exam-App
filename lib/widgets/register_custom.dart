

import 'package:flutter/material.dart';

class RegisterCustom extends StatefulWidget {
  final String? name;
  final String? lable;
  final TextEditingController? nameController;
  const RegisterCustom({super.key, this.name, this.lable, this.nameController});

  @override
  State<RegisterCustom> createState() => _RegisterCustomState();
}

class _RegisterCustomState extends State<RegisterCustom> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Padding(
      padding: EdgeInsets.only(top: hh * 0.02, left: 0.2),
      child: SizedBox(
        width: ww * 0.9,
        child: TextField(
          controller: widget.nameController!,
          decoration: InputDecoration(
              hintText: widget.name!,
              label: Text(widget.lable!),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
