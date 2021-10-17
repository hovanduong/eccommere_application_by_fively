import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';
import 'package:get/get.dart';

import 'widget/components/widget_item_menu.dart';

class HomeScreen extends StatelessWidget {
  HomeViewModel? _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        viewModel: HomeViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..inittal(),
        builder: (context, viewModel, child) {
          return Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(
              children: [
                _buildPage(context),
                _buildBottonNavigate(context),
              ],
            ),
          );
        });
  }

  Widget _buildPage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),
      child: PageView.builder(
        controller: _viewModel!.pageController,
        onPageChanged: (index) => _viewModel!.onPageChange(index),
        itemCount: _viewModel!.navigations.length,
        itemBuilder: (_, index) => _viewModel!.navigations[index].page,
      ),
    );
  }

  Widget _buildBottonNavigate(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: Get.width,
        height: Get.height * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppValues.DEFAULT_PADDING),
              topRight: Radius.circular(AppValues.DEFAULT_PADDING),
            ),
            color: Theme.of(context).bottomAppBarColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                color: Theme.of(context).disabledColor.withAlpha(80),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _viewModel!.navigations
              .map(
                (e) => InkWell(
                  onTap: () => _viewModel!
                      .onPageChange(_viewModel?.navigations.indexOf(e) ?? 0),
                  child: ItemMenuWidget(
                      icActive: e.imagePathActive,
                      name: e.name,
                      icPath: e.imgPath,
                      active: _viewModel?.navigations.indexOf(e) ==
                              _viewModel!.currentPage
                          ? true
                          : false),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
