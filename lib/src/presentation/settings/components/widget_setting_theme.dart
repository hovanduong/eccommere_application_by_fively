import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetSettingTheme extends StatelessWidget {
  final int value;
  final Function(String? value) onChange;

  WidgetSettingTheme({required this.onChange, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.DEFAULT_PADDING, vertical: Get.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Theme settings", style: STYLE_MEDIUM_BOLD),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select your theme your app"),
              DropdownButton<String>(
                dropdownColor: Theme.of(context).backgroundColor,
                focusColor: Colors.white,
                value: value == 0
                    ? "System"
                    : value == 1
                        ? "Light"
                        : "Dark",
                //elevation: 5,
                style: STYLE_SMALL_BOLD.copyWith(
                    color: Theme.of(context).colorScheme.secondary),
                iconEnabledColor: Theme.of(context).colorScheme.secondary,
                items: <String>["System", "Light", "Dark"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary)));
                }).toList(),
                hint: Text("Select your theme mode", style: STYLE_SMALL_BOLD),
                onChanged: onChange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
