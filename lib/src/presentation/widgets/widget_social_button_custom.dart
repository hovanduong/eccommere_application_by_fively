import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetButtonSocialCustom extends StatelessWidget {
  final String imagePath;
  const WidgetButtonSocialCustom({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.DEFAULT_PADDING * 2,
        vertical: AppValues.DEFAULT_PADDING,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
                color: Theme.of(context).shadowColor.withAlpha(80))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        imagePath,
        width: 20,
      ),
    );
  }
}
