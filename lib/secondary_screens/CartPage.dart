import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_food/model/food.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:user_food/secondary_screens/Cart_products.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: new Cart_products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Total:"),
              subtitle: Text("\Rs = ${returnTotalAmount(foodNotifier.userFoodCart)}"),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  "Check out",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

returnTotalAmount(List<Food> userFoodCart) {
  int totalAmount = 0;
  int quantity = 1;
  for (int i = 0; i < userFoodCart.length; i++) {
    var Price = int.parse(userFoodCart[i].price);
    totalAmount = totalAmount + Price *
        quantity;
       // userFoodCart[i].quantity;
  }
  return totalAmount;
      //.toStringAsFixed(1);
}



