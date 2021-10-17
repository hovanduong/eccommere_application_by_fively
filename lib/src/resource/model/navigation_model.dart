import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/page/bag_page/bag_pgae.dart';
import 'package:flutter_app/src/presentation/page/favorite_page/favorite_page.dart';
import 'package:flutter_app/src/presentation/page/home_page/home_page.dart';
import 'package:flutter_app/src/presentation/page/profile_page/profile_page.dart';
import 'package:flutter_app/src/presentation/page/shop_page/shop_page.dart';

class NavigationModel {
  final String name;
  final String imgPath;
  final Widget page;

  NavigationModel(
      {required this.name, required this.imgPath, required this.page});
}

List<NavigationModel> navidationData() {
  return [
    new NavigationModel(
        name: "Home", imgPath: AppImages.icHome, page: HomePage()),
    new NavigationModel(
        name: "Shop", imgPath: AppImages.icShop, page: ShopPage()),
    new NavigationModel(name: "Bag", imgPath: AppImages.icBag, page: BagPage()),
    new NavigationModel(
        name: "Favorites",
        imgPath: AppImages.icFavorites,
        page: FavoritePage()),
    new NavigationModel(
        name: "Profile", imgPath: AppImages.icProfile, page: ProfilePage()),
  ];
}
