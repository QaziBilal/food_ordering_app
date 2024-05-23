// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart' as sql;

import 'package:food_ordering_app/src/Database/SqlHelper.dart';
import 'package:food_ordering_app/src/models/cartModel.dart';
import 'package:food_ordering_app/src/models/food_item.dart';

class CartSqlHelper {
  static Future<CartModel1> saveCart(CartModel1 cartModel1) async {
    final db = await SqlHelper.db();
    final data = {
      'quantity': cartModel1.quantity,
      'fooditemId': cartModel1.fooditemId,
    };
    await db.insert('tbl_cart', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("Cart Model = ${cartModel1.cartId}");
    return cartModel1;
  }

  static Future<List<Map<String, dynamic>>> getCart() async {
    final db = await SqlHelper.db();
    return db.query('tbl_cart');
  }

  static Future<int> deleteCart(int cartId) async {
    final db = await SqlHelper.db();
    return db.delete('tbl_cart', where: 'cartId = ?', whereArgs: [cartId]);
  }

  static Future<List<Map<String, dynamic>>> getCartAndFooItemData() async {
    final database = await SqlHelper.db();

    return database.rawQuery(
        '''SELECT * FROM tbl_cart INNER JOIN tbl_food_item ON tbl_food_item.foodItemId = tbl_cart.fooditemId''');
  }

  static Future<int> updateCart(int cartId, int quantity) async {
    final db = await SqlHelper.db();
    final data = {'quantity': quantity};
    return db.update('tbl_cart', data, where: 'cartId=?', whereArgs: [cartId]);
  }
}

class FoodItemInCart {
  final FoodItemModel1 foodItemModel1;
  final CartModel1 cartModel1;
  FoodItemInCart({
    required this.foodItemModel1,
    required this.cartModel1,
  });
}
