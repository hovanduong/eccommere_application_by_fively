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
  final String imagePathActive;
  NavigationModel(
      {required this.name,
      required this.imgPath,
      required this.page,
      required this.imagePathActive});
}

List<NavigationModel> navidationData() {
  return [
    new NavigationModel(
        name: "Home",
        imgPath: AppImages.icHome,
        page: HomePage(),
        imagePathActive: AppImages.icHomeActive),
    new NavigationModel(
        name: "Shop",
        imgPath: AppImages.icShop,
        page: ShopPage(),
        imagePathActive: AppImages.icShopActive),
    new NavigationModel(
        name: "Bag",
        imgPath: AppImages.icBag,
        page: BagPage(),
        imagePathActive: AppImages.icBagActive),
    new NavigationModel(
        name: "Favorites",
        imgPath: AppImages.icFavorites,
        page: FavoritePage(),
        imagePathActive: AppImages.icFavoritesActive),
    new NavigationModel(
        name: "Profile",
        imgPath: AppImages.icProfile,
        page: ProfilePage(),
        imagePathActive: AppImages.icProfileActive),
  ];
}
