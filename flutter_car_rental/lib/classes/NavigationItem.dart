import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);

  static List<NavigationItem> getNavigationItemList() {
    return <NavigationItem>[
      NavigationItem(Icons.home),
      NavigationItem(Icons.calendar_today),
      NavigationItem(Icons.notifications),
      NavigationItem(Icons.person),
    ];
  }
}
