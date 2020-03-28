import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_food/api/food_api.dart';
import 'package:user_food/notifier/auth_notifier.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
        actions: <Widget>[
          // action button
          RaisedButton(
            elevation: 10,
            shape: CircleBorder(
                //borderRadius: BorderRadius.all(Radius.circular(250))
              ),
            color: Colors.white70,
            onPressed: () => signout(authNotifier),
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            height: 110,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage('images/Picture-Unavailable.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              authNotifier.user.displayName,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Text(
              authNotifier.user.email,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Orders')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Return')
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding:  const EdgeInsets.fromLTRB(90, 150, 85, 150),
                child: Text("Developed By: VISHAL KANU",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red),),
              )
            ],
          )
          //RaisedButton(onPressed: () {},)
        ]),
      ),
    );
  }
}
