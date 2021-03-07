import 'dart:io';

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final Function onTap;

  const Avatar({this.avatarUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: avatarUrl == null
            ? CircleAvatar(
                radius: 50.0,
                child:
                    Icon(Icons.photo_camera, size: 48, color: Colors.black87),
                backgroundColor: const Color(0xFF00EB5A),
              )
            : (avatarUrl.contains("storage/emulated")
                ? CircleAvatar(
                    radius: 50.0,
                    backgroundImage: FileImage(File(avatarUrl)),
                  )
                : CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(avatarUrl),
                  )),
      ),
    );
  }
}
