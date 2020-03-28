import 'package:user_food/model/food.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<Food> userFoodCart = [];

  List<Food> addToList(Food food) {
    bool isPresent = false;
    if (userFoodCart.length > 0) {
      for (int i = 0; i < userFoodCart.length; i++) {
        if (userFoodCart[i].id == food.id) {
          increaseItemQuantity(food);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        userFoodCart.add(food);
      }
    } else {
      userFoodCart.add(food);
    }
    return userFoodCart;
  }

  List<Food> removeFromList(Food food) {
    if (food.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantity(food);
    } else {
      //remove it from the list
      userFoodCart.remove(food);
    }
    return userFoodCart;
  }

 void increaseItemQuantity(Food food) => food.incrementQuantity();
void decreaseItemQuantity(Food food) => food.decrementQuantity();
}
