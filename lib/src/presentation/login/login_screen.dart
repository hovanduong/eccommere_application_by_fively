import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/login/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        onViewModelReady: (viewmodel) => _viewModel = viewmodel?..initial(),
        viewModel: LoginViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold();
        });
  }
}
