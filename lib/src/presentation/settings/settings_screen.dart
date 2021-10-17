import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/settings/components/widget_setting_theme.dart';
import 'package:flutter_app/src/presentation/settings/setting_viewmodel.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  late SettingsViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    _buildTitle(context),
                    _buildNotificationSetting(context),
                    _buildThemeSetting(context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.secondary),
            onPressed: () => Get.back(),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.secondary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.DEFAULT_PADDING, vertical: Get.height * 0.01),
      child: Text("Settings",
          style: STYLE_MEDIUM_BOLD.copyWith(fontSize: Get.width * 0.07)),
    );
  }

  Widget _buildThemeSetting(BuildContext context) {
    return StreamBuilder<int>(
        stream: _viewModel.selectThemeSteaam,
        builder: (context, snapshot) {
          return WidgetSettingTheme(
              onChange: (value) => _viewModel.onChangeTheme(value),
              value: snapshot.data ?? 0);
        });
  }

  Widget _buildNotificationSetting(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.DEFAULT_PADDING, vertical: Get.height * 0.01),
      child: Column(
        children: [
          Text("Notifications", style: STYLE_MEDIUM_BOLD),
        ],
      ),
    );
  }
}
