// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:food_ordering_app/src/models/food_item.dart';

class CartModel {
  int cartId;
  int quantity;
  FoodItemModel foodItem;
  double totalPrice;

  CartModel(
      {required this.cartId,
      required this.quantity,
      required this.foodItem,
      required this.totalPrice});
}

class CartModel1 {
  int cartId;
  int quantity;
  int fooditemId;

  CartModel1({
    this.cartId = 0,
    required this.quantity,
    required this.fooditemId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartId': cartId,
      'quantity': quantity,
      'fooditemId': fooditemId,
    };
  }

  factory CartModel1.fromMap(Map<String, dynamic> map) {
    return CartModel1(
      cartId: map['cartId'] as int,
      quantity: map['quantity'] as int,
      fooditemId: map['fooditemId'] as int,
    );
  }
}
