import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/page/profile_page/profile_page_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/widget_profile_item.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  late ProfilePageViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProfilePageViewModel>(
        viewModel: ProfilePageViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchButton(context),
                    _bildBody(context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildSearchButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: SvgPicture.asset(AppImages.icSearch),
        onPressed: () {},
      ),
    );
  }

  Widget _bildBody(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: AppValues.DEFAULT_PADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My profile", style: STYLE_LARGE_BOLD),
          _buildAvatar(context),
          SizedBox(height: 20),
          _buildMenuProfile(context),
        ],
      ),
    ));
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.avatarDefault),
            radius: Get.width * 0.09,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Matilda Brown", style: STYLE_MEDIUM_BOLD, maxLines: 1),
              Text("matildabrown@mail.com",
                  style: TextStyle(color: Theme.of(context).disabledColor)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuProfile(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WidgetProfileItem(
              title: "My Orders",
              description: "Already have 12 orders",
              hasBorder: true,
              onPress: () {},
            ),
            WidgetProfileItem(
              title: "Shiping Address",
              description: "3 Address",
              hasBorder: true,
              onPress: () {},
            ),
            WidgetProfileItem(
              title: "Payment methods",
              description: "Visa **34",
              hasBorder: true,
              onPress: () {},
            ),
            WidgetProfileItem(
              title: "Promocodes",
              description: "You have special promocodes",
              hasBorder: true,
              onPress: () {},
            ),
            WidgetProfileItem(
              title: "My Reviews",
              description: "Reviews for 4 items",
              hasBorder: true,
              onPress: () {},
            ),
            WidgetProfileItem(
              title: "Settings",
              description: "Notification, password",
              hasBorder: false,
              onPress: () => Get.toNamed(Routers.setting),
            ),
          ],
        ),
      ),
    );
  }
}
