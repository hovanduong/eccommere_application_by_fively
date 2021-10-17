import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/page/profile_page/profile_page_viewmodel.dart';

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
            body: Container(
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
