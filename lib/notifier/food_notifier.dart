import 'dart:collection';
import 'package:user_food/model/food.dart';
import 'package:flutter/cupertino.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _currentFood;
  List<Food> userFoodCart = List();

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);

  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }

  addFood(Food food) {
    _foodList.insert(0, food);
    notifyListeners();
  }

  addToUserCart(Food food) {
    userFoodCart.insert(0, food);
    notifyListeners();
  }

  removeFromUserCart(Food food) {
    userFoodCart.removeWhere(
            (food) => food != null
    );
    notifyListeners();
  }
}
