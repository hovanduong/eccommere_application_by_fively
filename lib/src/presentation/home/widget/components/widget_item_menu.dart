import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemMenuWidget extends StatelessWidget {
  final String name;
  final String icPath;
  final bool active;
  final String icActive;
  ItemMenuWidget(
      {required this.name,
      required this.icPath,
      required this.active,
      required this.icActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            active ? icActive : icPath,
            color: active
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            height: Get.height * 0.03,
          ),
          SizedBox(height: 3),
          Text(
            name,
            style: STYLE_SMALL_BOLD.copyWith(
                fontSize: Get.height * 0.015,
                color: active
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor),
          )
        ],
      ),
    );
  }
}
