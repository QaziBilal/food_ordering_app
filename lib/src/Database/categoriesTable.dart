import 'package:food_ordering_app/src/Database/SqlHelper.dart';
import 'package:food_ordering_app/src/models/cateogry.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CategorySqlHelper {
  static Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await SqlHelper.db();
    return db.query('tbl_category');
  }

  static Future<CategoryModel> saveCategory(CategoryModel categoryModel) async {
    final db = await SqlHelper.db();
    final data = {
      'categoryName': categoryModel.categoryName,
      'categoryImage': categoryModel.categoryImage,
    };
    await db.insert('tbl_category', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("data added = ${categoryModel.categoryID}");

    return categoryModel;
  }
}
