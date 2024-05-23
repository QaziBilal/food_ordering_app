import '../models/food_item.dart';
import 'SqlHelper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FoodItemSqlHelper {
  static Future<FoodItemModel> insertFoodItem(
      categoryId, FoodItemModel foodItem) async {
    final db = await SqlHelper.db();
    final data = {
      'categoryID': categoryId,
      'foodItemName': foodItem.foodItemName,
      'foodItemImage': foodItem.foodItemImage,
      'price': foodItem.price
    };
    await db.insert('tbl_food_item', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("data Added: ${foodItem.foodiItemId}");
    return foodItem;
  }

  static Future<List<Map<String, dynamic>>> getFoodItems(
      int? categoryID) async {
    final db = await SqlHelper.db();
    return db
        .query('tbl_food_item', where: 'categoryID=?', whereArgs: [categoryID]);
  }
}
