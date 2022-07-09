import 'package:flutter/material.dart';

class Navigation {
  static intent(BuildContext context, Widget nextWidget,
      {VoidCallback? onFinished}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => nextWidget))
        .then((value) {
      if (onFinished == null) return;

      onFinished();
    });
  }

  static intentStraight(BuildContext context, Widget nextWidget,
      {VoidCallback? onFinished}) {
    Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => nextWidget), (route) => false)
        .then((value) {
      if (onFinished == null) return;

      onFinished();
    });
  }
}
