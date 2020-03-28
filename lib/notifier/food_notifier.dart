import 'dart:collection';
import 'package:user_food/bloc/provider.dart';
import 'package:user_food/model/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class FoodNotifier with ChangeNotifier {
  var _listController = BehaviorSubject<List<Food>>.seeded([]);

//provider class
  CartProvider provider = CartProvider();

//output
  Stream<List<Food>> get listStream => _listController.stream;

//input
  Sink<List<Food>> get listSink => _listController.sink;

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

  addToList(Food userFoodCart) {
    listSink.add(provider.addToList(userFoodCart));
  }

  removeFromList(Food userFoodCart) {
    listSink.add(provider.removeFromList(userFoodCart));
  }

  addToUserCart(Food food) {
    userFoodCart.insert(0, food);
    notifyListeners();
  }
}
