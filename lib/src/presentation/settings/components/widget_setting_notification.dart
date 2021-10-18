import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class WidgetSettingNotifications extends StatelessWidget {
  final Function(bool value) onChage;

  WidgetSettingNotifications({required this.onChage});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.DEFAULT_PADDING, vertical: Get.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Notifications",
              style: STYLE_MEDIUM_BOLD.copyWith(
                  color: Theme.of(context).colorScheme.secondary)),
          SizedBox(height: 5),
          _buildNotificationChild(context),
        ],
      ),
    );
  }

  Widget _buildNotificationChild(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _saleNotifiSetting(context),
        ],
      ),
    );
  }

  Widget _saleNotifiSetting(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Sales",
              style: STYLE_SMALL.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary)),
          FlutterSwitch(
            activeColor: Theme.of(context).primaryColor,
            toggleColor: Theme.of(context).colorScheme.secondary,
            width: Get.width * 0.14,
            height: 25,
            valueFontSize: 18,
            toggleSize: 20,
            value: true,
            borderRadius: 30.0,
            padding: 5.0,
            onToggle: onChage,
          ),
        ],
      ),
    );
  }
}
