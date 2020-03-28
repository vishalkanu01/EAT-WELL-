import 'package:flutter/material.dart';
import 'package:user_food/api/food_api.dart';
import 'package:user_food/model/food.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:provider/provider.dart';
import 'package:user_food/secondary_screens/Cart_products.dart';

class Cart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return StreamBuilder(
      stream: foodNotifier.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodNotifier.userFoodCart = snapshot.data;
          return Scaffold(
            appBar: new AppBar(
              elevation: 10.0,
              backgroundColor: Colors.red,
              title: Text('Cart'),
            ),
            body: new Cart_products(),
            bottomNavigationBar: new Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                        title: new Text("Total:"),
                        subtitle: Text(
                            "\Rs = ${returnTotalAmount(foodNotifier
                                .userFoodCart)}"),
                      )),
                  Expanded(child: OrderButton()),
                ],
              ),
            ),
          );
        } else {
          return Container(
            child: Text("Something returned null"),
          );
        }
      },
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return MaterialButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(500))),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(' Your order is placed'),
            duration: Duration(milliseconds: 1000),
          );
         // _onsaved();
          Scaffold.of(context).showSnackBar(snackBar);
        },
        color: Colors.red,
        textColor: Colors.white,
        child: new Text("Check Out"));
  }
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
}
