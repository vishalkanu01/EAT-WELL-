import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:user_food/api/food_api.dart';
import 'package:user_food/model/food.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:user_food/notifier/auth_notifier.dart';

import 'package:user_food/secondary_screens/Cart_products.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ProductService productService = ProductService();
  bool uploaded = false;

  Food get food => null;

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
      body: Form(key: _formKey, child: new Cart_products()),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Total:"),
              subtitle:
                  Text("\Rs = ${returnTotalAmount(foodNotifier.userFoodCart)}"),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {
                  _onsaved();
                },
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

  returnTotalAmount(List<Food> userFoodCart) {
    int totalAmount = 0;
    int quantity = 1;
    for (int i = 0; i < userFoodCart.length; i++) {
      var Price = int.parse(userFoodCart[i].price);
      totalAmount = totalAmount + Price * quantity;
      // userFoodCart[i].quantity;
    }
    return totalAmount;
    //.toStringAsFixed(1);
  }

  void _onsaved() async {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    if (_formKey.currentState.validate()) {
      setState(() => uploaded = true);
      for (int i = 0; i < foodNotifier.userFoodCart.length; i++) {
        productService.uploadProduct({
          "User ID": authNotifier.user.uid.toString(),
          "User Name": authNotifier.user.displayName.toString(),
          "name": foodNotifier.userFoodCart[i].name.toString(),
          "image": foodNotifier.userFoodCart[i].image.toString(),
          "price": foodNotifier.userFoodCart[i].price.toString(),
        });
        Fluttertoast.showToast(msg: 'Your order is placed.');
        Navigator.pop(context);
      }
    } else {
      setState(() => uploaded = false);
    }
    if (uploaded = true) {
      print("delete was called");
      removeFromCart(foodNotifier.userFoodCart);
    }
  }

  void removeFromCart(List<Food> userFoodCart) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    foodNotifier.removeFromUserCart(food);
  }
}
