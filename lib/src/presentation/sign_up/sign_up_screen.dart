import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/sign_up/sign_up_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_inputfield_custom.dart';
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
    return Container(
      margin: EdgeInsets.only(top: AppValues.DEFAULT_PADDING * 2),
      child: Form(
        child: Column(
          children: [
            _buildInputName(context),
            _buildInputEmail(context),
          ],
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
}
