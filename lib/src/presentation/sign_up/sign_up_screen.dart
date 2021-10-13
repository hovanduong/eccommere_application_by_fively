import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/sign_up/sign_up_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_inputfield_custom.dart';
import 'package:flutter_app/src/presentation/widgets/widget_passwordfield_custom.dart';
import 'package:flutter_app/src/presentation/widgets/widget_social_button_custom.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpViewModel? _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignUpViewModel>(
        viewModel: SignUpViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..intial(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.DEFAULT_PADDING,
                vertical: AppValues.DEFAULT_PADDING,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackIcon(context),
                  _buildSignUpText(context),
                  _buildForm(context),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBackIcon(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: AppValues.DEFAULT_PADDING,
        vertical: AppValues.DEFAULT_PADDING,
      ),
      child: Text(
        "sign_up".tr,
        style: STYLE_MEDIUM_BOLD.copyWith(fontSize: 25),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: AppValues.DEFAULT_PADDING * 2),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputName(context),
                _buildInputEmail(context),
                _buildInputPassword(context),
                _buildInputPasswordConfirm(context),
                _buildAlreadyAccountText(context),
                _buildButtonnubmit(context),
                _buildSocialAuth(context),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputName(BuildContext context) {
    return WidgetCustomInputField(
      label: "Name",
      controller: _viewModel!.nameTextEditingController,
      textError: _viewModel!.nameError,
      onChange: (value) => _viewModel!.validationName(),
    );
  }

  Widget _buildInputEmail(BuildContext context) {
    return WidgetCustomInputField(
      label: "Email",
      controller: _viewModel!.emaiTextEditingController,
      textError: _viewModel!.nameError,
      onChange: (value) => _viewModel!.validationName(),
    );
  }

  Widget _buildInputPassword(BuildContext context) {
    return WidgetInputPasswordCustom(
        label: "Password",
        controller: _viewModel!.passwrodTextEditingController,
        textError: _viewModel!.passwordError,
        onChange: (value) => _viewModel!.validationName());
  }

  Widget _buildInputPasswordConfirm(BuildContext context) {
    return WidgetInputPasswordCustom(
        label: "Password Confirm",
        controller: _viewModel!.passwrodTextEditingController,
        textError: _viewModel!.passwordError,
        onChange: (value) => _viewModel!.validationName());
  }

  Widget _buildAlreadyAccountText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.bottomRight,
      child: Text("already_have_an_account".tr),
    );
  }

  Widget _buildButtonnubmit(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 0,
              offset: Offset(-1, 0),
              color: Theme.of(context).shadowColor.withAlpha(80),
            )
          ]),
      height: 50,
      child: Text(
        'sign_up'.tr,
        style: STYLE_SMALL_BOLD.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildSocialAuth(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.1),
      child: Column(
        children: [
          _buildText(context),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildGoogleSocial(context),
              SizedBox(width: 20),
              _buildFacebookSocial(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text("or_sign_up_with_social_account".tr,
        style: STYLE_SMALL_BOLD.copyWith(color: Theme.of(context).accentColor));
  }

  Widget _buildGoogleSocial(BuildContext context) {
    return WidgetButtonSocialCustom(
      imagePath: AppImages.icGoogle,
    );
  }

  Widget _buildFacebookSocial(BuildContext context) {
    return WidgetButtonSocialCustom(
      imagePath: AppImages.icFacebook,
    );
  }
}
