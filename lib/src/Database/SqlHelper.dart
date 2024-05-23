import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase("foodApp.db", version: 1,
        onCreate: (db, version) async {
      await tbl_category(db);
      await createFoodItemTable(db);
      await createCartTable(db);
    });
  }

  static Future<void> tbl_category(sql.Database database) async {
    await database.execute('''
  create table tbl_category(
    categoryId INTEGER PRIMARY KEY AUTOINCREMENT,
    categoryName text,
    categoryImage text
  )
''');
    print("Category Table Created");
  }

  static Future<void> createFoodItemTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE tbl_food_item(
      foodItemId INTEGER PRIMARY KEY AUTOINCREMENT,
      categoryID INTEGER,
      foodItemName TEXT,
      foodItemImage TEXT,
      price INTEGER,
      FOREIGN KEY (categoryID) REFERENCES tbl_category(categoryId)
    )
  ''');
    print("FoodItem Table Created");
  }

  static Future<void> createCartTable(sql.Database database) async {
    await database.execute('''
      CREATE TABLE tbl_cart(
        cartId INTEGER PRIMARY KEY AUTOINCREMENT,
        quantity INTEGER,
        totalPrice INTEGER,
        fooditemId INTEGER,
        currentPrice INTEGER,
        FOREIGN KEY (foodItemId) REFERENCES tbl_food_item(foodItemId)
        
      )
''');
    print("Cart Table Created");
  }
}
