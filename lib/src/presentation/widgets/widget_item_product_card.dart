import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WidgetItemProductCard extends StatelessWidget {
  const WidgetItemProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 15),
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
            color: Theme.of(context).disabledColor.withAlpha(80),
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardImage(context),
                  _buildCardInfo(context),
                ]),
          ),
          _buildBadge(context),
          _buildLikeButton(context),
        ],
      ),
    );
  }

  Widget _buildRatingbar(BuildContext context) {
    return RatingBar.builder(
      itemSize: 15,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1),
      tapOnlyMode: true,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _buildCardImage(BuildContext context) {
    return Container(
      height: Get.width * 0.45,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.imgProduct),
        ),
      ),
    );
  }

  Widget _buildCardInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.DEFAULT_PADDING / 2,
          vertical: AppValues.DEFAULT_PADDING / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRatingbar(context),
          Text(
            "Dorothy Perkins",
            style: STYLE_SMALL.copyWith(
              color: Theme.of(context).accentColor,
            ),
          ),
          Text("Evenning Dress",
              maxLines: 1,
              style: STYLE_SMALL_BOLD.copyWith(
                fontSize: 15,
              )),
          Row(
            children: [
              Text("15\$"),
              SizedBox(width: 3),
              Text("15\$"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    return Positioned(
        top: 5,
        left: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            "-20%",
            style: STYLE_SMALL_BOLD.copyWith(color: Colors.white),
          ),
        ));
  }

  Widget _buildLikeButton(BuildContext context) {
    return Positioned(
        top: Get.width * 0.45 - 20,
        right: 0,
        child: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
                color: Theme.of(context).disabledColor.withAlpha(80),
              )
            ],
          ),
          child: SvgPicture.asset(
            AppImages.icLove,
            height: 20,
            fit: BoxFit.cover,
          ),
        ));
  }
}
