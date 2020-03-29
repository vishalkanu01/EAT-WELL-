import 'package:flutter/cupertino.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_food/model/food.dart';
import 'package:user_food/secondary_screens/CartPage.dart';

class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Buy food'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: new Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                new Positioned(
                    child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.brightness_1,
                        size: 25.0, color: Colors.blueAccent),
                    new Positioned(
                        top: 5.0,
                        right: 8.5,
                        child: new Center(
                          child: new Text(
                            foodNotifier.userFoodCart.length.toString(),
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(foodNotifier.currentFood.image),
                ),
                footer: new Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: new Text(foodNotifier.currentFood.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                        title: new Row(
                          children: <Widget>[
                            Expanded(
                                child: new Text(
                              "\RS ${foodNotifier.currentFood.price}",
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                          ],
                        ))),
              )),
          // ========== the first buttons========
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new ListTile(
              title: new Text(
                "Indrigents:",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
              subtitle: Text(foodNotifier.currentFood.details),
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(child: SomeButton()),
            ],
          ),
        ],
      ),
    );
  }
}

class SomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    addToCart(Food food) {
      foodNotifier.addToUserCart(food);
    }

    return MaterialButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(500))),
        onPressed: () {
          addToCart(foodNotifier.currentFood);
          final snackBar = SnackBar(
            content: Text('${foodNotifier.currentFood.name} added to Cart'),
            duration: Duration(milliseconds: 1000),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
        color: Colors.red,
        textColor: Colors.white,
        child: new Text("Add to cart"));
  }
}
