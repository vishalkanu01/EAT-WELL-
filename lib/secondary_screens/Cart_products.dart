import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_food/notifier/food_notifier.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return new ListView.builder(
        itemCount: foodNotifier.userFoodCart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: foodNotifier.userFoodCart[index].name,
            cart_prod_price: foodNotifier.userFoodCart[index].price,
            cart_prod_picture: foodNotifier.userFoodCart[index].image,
              cart_prod_qty: foodNotifier.userFoodCart[index].quantity,
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty ;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
     this.cart_prod_qty,
  });

  double _buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Card(
      child: ListTile(
        // ============ leading section==================
        leading: new Image.network(
          cart_prod_picture,
          width: 60.0,
          height: 100.0,
        ),
        //========= Title section========
        title: new Text(
          cart_prod_name,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        //============Subtitle section=============
        subtitle: new Column(
          children: <Widget>[
//   ===================== This section is for the product price==============
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\RS ${cart_prod_price}",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
        trailing: Container(
          margin: EdgeInsets.only(right: 0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300], width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 5),
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: _buttonWidth,
                height: _buttonWidth,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                   foodNotifier.currentFood.quantity--;
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ),
              ),
              Text(

                '$cart_prod_qty',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(
                width: _buttonWidth,
                height: _buttonWidth,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    foodNotifier.currentFood.quantity++;
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        //new Row(
        //          children: <Widget>[
        //            Expanded(
        //              child: MaterialButton(
        //                minWidth: 0,
        //                padding: EdgeInsets.zero,
        //                child: Icon(Icons.add),
        //                onPressed: () {},
        //              ),
        //            ),
        //            SizedBox.fromSize(
        //              size: Size(20, 20),
        //              child: Text('$cart_prod_qty'),
        //            ),
        //            Expanded(
        //              child: MaterialButton(
        //                minWidth: 0,
        //                padding: EdgeInsets.zero,
        //                child: Icon(Icons.remove),
        //                onPressed: () {},
        //              ),),
        //          ],
        //        ),
      ),
    );
  }
}
