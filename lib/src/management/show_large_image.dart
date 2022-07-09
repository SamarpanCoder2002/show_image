import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/types.dart';

class ImageFullScreen extends StatelessWidget {
  final ImgType imgType;
  final String imagePath;
  final Color bgColor;
  final FitType largeScreenFitType;

  const ImageFullScreen(
      {Key? key,
      required this.imgType,
      required this.imagePath,
      required this.bgColor,
      required this.largeScreenFitType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: bgColor,
            image:
                DecorationImage(image: _getPerfectImage, fit: _getPerfectFit)),
      ),
    );
  }

  ImageProvider get _getPerfectImage {
    switch (imgType) {
      case ImgType.network:
        return CachedNetworkImageProvider(imagePath);
      case ImgType.file:
        return FileImage(File(imagePath));
      case ImgType.asset:
        return ExactAssetImage(imagePath);
    }
  }

  BoxFit? get _getPerfectFit {
    switch (largeScreenFitType) {
      case FitType.normal:
        return null;
      case FitType.covered:
        return BoxFit.cover;
      case FitType.filled:
        return BoxFit.fill;
      case FitType.contained:
        return BoxFit.contain;
      case FitType.coverWidth:
        return BoxFit.fitWidth;
      case FitType.coverHeight:
        return BoxFit.fitHeight;
    }
  }
}
