import 'package:food_app/models/menuItemsModel.dart';
import 'package:food_app/res/items.dart';

List<MenuItemsModel> MenuItemsModelList = [];

List menuList = [
  {
    'image': 'asset/pizaa.png',
    'name': 'Pizzas',
    'totalItems': pizzaItems.length.toInt(),
    'items': pizzaItems,
  },
  {
    'image': 'asset/hamburger.png',
    'name': 'Hamburgers',
    'totalItems': hambugerItem.length.toInt(),
    'items': hambugerItem,
  },
  {
    'image': 'asset/refri.png',
    'name': 'Bebidas',
    'totalItems': bebidasItem.length.toInt(),
    'items': bebidasItem,
  },
];
