import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_image/src/management/show_large_image.dart';

import '../config/color_collection.dart';
import '../config/types.dart';
import '../services/device_specific_operation.dart';
import '../services/navigation_operation.dart';

class ShowImage extends StatefulWidget {
  final bool isLightMode, imageClickable;
  final Color? bgColor;
  final double borderRadius;
  final double? width, height;
  final String imagePath;
  final FitType fitType;
  final FitType largeScreenFitType;

  const ShowImage(
      {Key? key,
      required this.imagePath,
      this.isLightMode = true,
      this.imageClickable = true,
      this.fitType = FitType.normal,
      this.largeScreenFitType = FitType.normal,
      this.borderRadius = 8.0,
      this.bgColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  void initState() {
    changeSystemStatusBarConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.imagePath != '',
        """imagePath can't be a empty string. Give a proper image path.""");

    return InkWell(
      onTap: _onClicked,
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: _getPerfectColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            image:
                DecorationImage(image: _getPerfectImage, fit: _getPerfectFit)),
      ),
    );
  }

  Color get _getPerfectColor {
    if (widget.bgColor != null) return widget.bgColor!;
    if (widget.isLightMode) return AppColors.standardLightModeBgColor;
    return AppColors.standardDarkModeBgColor;
  }

  ImageProvider get _getPerfectImage {
    if (widget.imagePath.startsWith('http') ||
        widget.imagePath.startsWith('https')) {
      return CachedNetworkImageProvider(widget.imagePath);
    }

    if (File(widget.imagePath).existsSync()) {
      return FileImage(File(widget.imagePath));
    }

    return ExactAssetImage(widget.imagePath);
  }

  BoxFit? get _getPerfectFit {
    switch (widget.fitType) {
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

  _onClicked() {
    if (!widget.imageClickable) return;

    Navigation.intent(
        context,
        ImageFullScreen(
            imgType: _getImgType,
            imagePath: widget.imagePath,
            bgColor: _getPerfectColor,
            largeScreenFitType: widget.largeScreenFitType));
  }

  ImgType get _getImgType {
    if (widget.imagePath.startsWith('http') ||
        widget.imagePath.startsWith('https')) {
      return ImgType.network;
    }

    if (File(widget.imagePath).existsSync()) {
      return ImgType.file;
    }

    return ImgType.asset;
  }
}
