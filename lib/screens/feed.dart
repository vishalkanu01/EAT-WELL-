import 'package:carousel_pro/carousel_pro.dart';
import 'package:user_food/api/food_api.dart';
import 'package:user_food/notifier/auth_notifier.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_food/secondary_screens/About.dart';
import 'package:user_food/secondary_screens/Products.dart';
import 'package:user_food/model/food.dart';
import 'package:user_food/secondary_screens/cartPage2.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

    // print("building Feed");
    Widget Image_carousel = new Container(
      height: 120.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/biryani.jpg'),
          AssetImage('images/pizza.jpg'),
          AssetImage('images/bread.jpg'),
          AssetImage('images/tacos.jpg'),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 1.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EAT-WELL!!!",
        ),
        actions: <Widget>[
          // Icon(Icons.shopping_cart),
          StreamBuilder(
            stream: foodNotifier.listStream,
            builder: (context, snapshot) {
              List<Food> userFoodCart = snapshot.data;

              int length = userFoodCart != null ? userFoodCart.length : 0;

              return buildGestureDetector(length, context, userFoodCart);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) => About()
                ));
              },
            ),
          ],
        ),
      ),
      body: new RefreshIndicator(
        child: new Column(
          children: <Widget>[
            //===========image carousel begins here=======
            Image_carousel,
            new Padding(
              padding: const EdgeInsets.all(0.0),
              // child: Text('Categories'),
            ),
//========================== padding widget================
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft, child: Text('Recent Foods')),
            ),
            // grind view
            Flexible(
              child: Products(),
            )
          ],
        ),
        onRefresh: _refreshList,
      ),
    );
  }
}

Widget buildGestureDetector(int length, BuildContext context, List<Food> userFoodCart) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cart2()
        //CartPage()
      ));
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
                        length.toString(),
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
  );
}
