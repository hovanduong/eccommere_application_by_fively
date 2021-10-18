import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WidgetProfileItem extends StatelessWidget {
  String title;
  String description;
  bool hasBorder;
  VoidCallback onPress;
  WidgetProfileItem({
    required this.title,
    required this.description,
    required this.hasBorder,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppValues.DEFAULT_PADDING),
        decoration: BoxDecoration(
          border: hasBorder
              ? Border(
                  bottom: BorderSide(
                  color: Theme.of(context).disabledColor.withAlpha(40),
                ))
              : Border(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(context),
            _buildRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      child: SvgPicture.asset(AppImages.icArrowNext),
    );
  }

  _buildTitle(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: STYLE_MEDIUM_BOLD.copyWith(
                  fontSize: 20 * Get.width * 0.0025,
                  color: Theme.of(context).colorScheme.secondary)),
          SizedBox(height: 5),
          Text(
            description,
            style: STYLE_SMALL.copyWith(color: Theme.of(context).disabledColor),
          ),
        ],
      ),
    );
  }
}
