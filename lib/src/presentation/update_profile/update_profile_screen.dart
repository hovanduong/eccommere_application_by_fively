import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/constants.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/update_profile/update_profile_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_bottom_sheet.dart';
import 'package:flutter_app/src/presentation/widgets/widget_inputfield_custom.dart';
import 'package:flutter_app/src/resource/bloc/profile_bloc.dart';
import 'package:flutter_app/src/resource/model/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpdateProfileScren extends StatelessWidget {
  late UpdateProfileViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<UpdateProfileViewModel>(
      viewModel: UpdateProfileViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
      builder: (_, viewModel, chuild) {
        return Scaffold(
          backgroundColor: Theme.of(_).backgroundColor,
          body: SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.DEFAULT_PADDING),
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildBody(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAciton(context),
          Container(
            margin: EdgeInsets.only(
                top: Get.height * 0.03, bottom: Get.height * 0.02),
            width: Get.width / 2,
            child: Text("your_personal_information".tr,
                style: STYLE_LARGE_BOLD.copyWith(
                    fontSize: 30 * Get.width * 0.0025,
                    color: Theme.of(context).colorScheme.secondary)),
          )
        ],
      ),
    );
  }

  Widget _buildAciton(BuildContext context) {
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: profileBloc.getProfile,
      builder: (_, snapShot) {
        if (snapShot.hasData) {
          UserModel? userModel = snapShot.data;
          _viewModel.initInput(userModel);
          EasyLoading.dismiss();
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildFirstNameInput(context, userModel),
                  _buildLastNameInput(context, userModel),
                  _buildEmailInput(context, userModel),
                  _buildPassWordInput(context, userModel),
                ],
              ),
            ),
          );
        } else {
          EasyLoading.show(status: "loading".tr);
          return Container();
        }
      },
    );
  }

  Widget _buildFirstNameInput(BuildContext context, UserModel? userModel) {
    return InkWell(
      child: Container(
        child: WidgetCustomInputField(
          controller: _viewModel.firstNameContoller,
          onChange: (value) {},
          textError: "",
          label: "First Name",
          enable: false,
        ),
      ),
      onTap: () => showModalBottomCustom(context),
    );
  }

  Widget _buildLastNameInput(BuildContext context, UserModel? userModel) {
    return Container(
      child: WidgetCustomInputField(
        controller: _viewModel.lasttNameContoller,
        onChange: (value) {},
        textError: "",
        label: "Last Name",
        enable: false,
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context, UserModel? userModel) {
    return Container(
      child: FocusScope(
        child: WidgetCustomInputField(
          controller: _viewModel.emailContoller,
          onChange: (value) {},
          textError: "",
          label: "Email",
          enable: false,
        ),
      ),
    );
  }

  Widget _buildPassWordInput(BuildContext context, UserModel? userModel) {
    return Container(
      child: WidgetCustomInputField(
        controller: _viewModel.passwordController,
        onChange: (value) {},
        textError: "",
        label: "Password",
        enable: false,
      ),
    );
  }
}
