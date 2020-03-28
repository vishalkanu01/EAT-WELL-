import 'package:user_food/api/food_api.dart';
import 'package:user_food/notifier/food_notifier.dart';
import 'package:user_food/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

   // print("building Products");
    return GridView.builder(
      itemCount: foodNotifier.foodList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Hero(
              tag: new Text("hero 1"),
              child: Material(
                child: InkWell(
                  onTap: () {
                    foodNotifier.currentFood = foodNotifier.foodList[index];
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return FoodDetail();
                    }));
                  },
                  child: GridTile(
                      footer: Container(
                        color: Colors.white70,
                        child: ListTile(
                          leading: Text(
                            foodNotifier.foodList[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            "\RS ${foodNotifier.foodList[index].price}",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      child: Image.network(
                        foodNotifier.foodList[index].image,
                        fit: BoxFit.cover,
                      )),
                ),
              )),
        );
      },
    );
  }
}
