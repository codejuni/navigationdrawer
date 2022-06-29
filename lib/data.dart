import 'package:flutter/material.dart';

class dataDrawer {
  late String name;
  late Widget widget;
  late IconData icon;

  dataDrawer({
    required this.name,
    required this.widget,
    required this.icon,
  });

  static List<dataDrawer> list = [
    dataDrawer(
      name: 'Home',
      widget: Container(),
      icon: Icons.home_outlined,
    ),
    dataDrawer(
      name: 'Search',
      widget: Container(),
      icon: Icons.search,
    ),
    dataDrawer(
      name: 'Favorite',
      widget: Container(),
      icon: Icons.favorite_border,
    ),
    dataDrawer(
      name: 'My Orders',
      widget: Container(),
      icon: Icons.list_alt_outlined,
    ),
    dataDrawer(
      name: 'Settings',
      widget: Container(),
      icon: Icons.settings_outlined,
    ),
  ];
}
