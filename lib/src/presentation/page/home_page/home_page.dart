// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/page/home_page/components/widget_product_list.dart';
import 'package:flutter_app/src/presentation/page/home_page/home_page_viewmodel.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  late HomePageViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePageViewModel>(
        viewModel: HomePageViewModel(),
        onViewModelReady: (viewModel) => _viewModel = viewModel!..initial(),
        builder: (_, viewModel, child) {
          return Scaffold(
            backgroundColor: Theme.of(_).backgroundColor,
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSale(context),
                    _buildProduct(context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildSale(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.7,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.homeSale,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 30,
              child: Container(
                padding: EdgeInsets.only(left: AppValues.DEFAULT_PADDING),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fashion \nsale",
                      style: STYLE_LARGE_BOLD.copyWith(
                        fontSize: 50,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Check",
                        style: STYLE_SMALL_BOLD.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildProduct(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildListNew(context),
        ],
      ),
    );
  }

  Widget _buildListNew(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WidgetProductList(title: "New"),
          WidgetProductList(title: "New"),
          WidgetProductList(title: "New"),
        ],
      ),
    );
  }
}
