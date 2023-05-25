import 'package:food_app/models/menuItemsModel.dart';
import 'package:food_app/providers/cartProvider.dart';
import 'package:food_app/res/menuItems.dart';
import 'package:food_app/views/Home.dart';
import 'package:food_app/views/cart.dart';
import 'package:food_app/views/detailsPage.dart';
import 'package:food_app/views/listItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  MenuItemsModelList =
      menuList.map((e) => MenuItemsModel.fromMap(data: e)).toList();

  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'itemDetailsPage': (context) => const ItemDetailsPage(),
        'cartPage': (context) => const cartPage(),
        'detailsPage': (context) => const DetailsPage(),
      },
    ),
  ));
}
