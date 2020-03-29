import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Food {
  String id;
  String name;
  String category;
  String image;
  String price;
  String details;
  List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;
 int quantity;

  Food({this.quantity = 1,});

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    price = data['price'];
    details = data['details'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    //quantity = data['quantity'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'price': price,
      'details' : details,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }




  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }

}

