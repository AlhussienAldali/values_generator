import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/features/add_value/widgets/add_value_page.dart';
import 'package:values_generator/features/favorites/widgets/favorites.dart';
import 'package:values_generator/features/values_page/widgets/values_page.dart';

List<Widget> buildScreens() {
  return [ValuesPage(), AddValue(), Favorites()];
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.format_quote_sharp,
        color: AppColors.white,
      ),
      title: ("Values".tr()),
      activeColorPrimary: AppColors.white,
      inactiveColorPrimary: AppColors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      activeColorPrimary: AppColors.white,
      inactiveColorPrimary: AppColors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.favorite,
        color: AppColors.white,
      ),
      title: ("Favorites".tr()),
      activeColorPrimary: AppColors.white,
      inactiveColorPrimary: AppColors.white,
    ),
  ];
}
