import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/widgets/widget_item_product_card.dart';
import 'package:get/get.dart';

class WidgetProductList extends StatelessWidget {
  final String title;
  WidgetProductList({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppValues.DEFAULT_PADDING, top: 20),
      child: Column(
        children: [
          _buildTitle(context),
          _buildProducts(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: STYLE_MEDIUM_BOLD.copyWith(fontSize: 30),
            ),
            Container(
              width: Get.width / 2,
              child: Text(
                "Est commodo consequat pariatur nostrud esse in velit dolor ex et mollit aliqua enim aliqua!",
                style: STYLE_SMALL,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildProducts(BuildContext context) {
    return Container(
      height: (Get.width * 0.35) * 2,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return WidgetItemProductCard();
          }),
    );
  }
}
