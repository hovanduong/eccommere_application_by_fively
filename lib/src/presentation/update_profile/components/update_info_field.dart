import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/configs/constanst/app_styles.dart';
import 'package:flutter_app/src/presentation/widgets/widget_inputfield_custom.dart';
import 'package:get/get.dart';

class WidgetUpdateInfo extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPress;
  const WidgetUpdateInfo({
    Key? key,
    required this.controller,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.DEFAULT_PADDING,
        vertical: AppValues.DEFAULT_PADDING * 2,
      ),
      child: Column(
        children: [
          _buildTitle(context),
          SizedBox(height: 10),
          _buildInput(context),
          _buildButton(context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      child: Text(
        "Change First Name",
        style: STYLE_MEDIUM_BOLD.copyWith(
            color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Get.width * 0.2, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          "done",
          style: STYLE_SMALL_BOLD.copyWith(
              fontSize: 15 * Get.width * 0.0025,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Container(
      child: WidgetCustomInputField(
        controller: controller,
        onChange: (value) {},
        textError: "",
        label: "First Name",
      ),
    );
  }
}
