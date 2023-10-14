// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CircleAvatar buildProfileImage(profileHeight, img) {
  return CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade200,
    child: Padding(
      padding: const EdgeInsets.all(1), // Border radius
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: profileHeight,
          height: profileHeight,
          imageUrl: img,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}
