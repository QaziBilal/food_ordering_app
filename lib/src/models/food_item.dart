// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodItemModel {
  int foodiItemId;
  int categoryID;
  String foodItemName;
  String foodItemImage;
  int price;
  bool plus;
  FoodItemModel({
    required this.foodiItemId,
    required this.categoryID,
    required this.foodItemName,
    required this.foodItemImage,
    required this.price,
    this.plus = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodiItemId': foodiItemId,
      'categoryID': categoryID,
      'foodItemName': foodItemName,
      'foodItemImage': foodItemImage,
      'price': price,
      'plus': plus,
    };
  }
}

class FoodItemModel1 {
  int? foodiItemId;
  int? categoryID;
  String? foodItemName;
  String? foodItemImage;
  int? price;

  FoodItemModel1.fromMap(Map<String, dynamic> map) {
    foodiItemId = map['foodItemId'];
    categoryID = map['categoryID'];
    foodItemName = map['foodItemName'];
    foodItemImage = map['foodItemImage'];
    price = map['price'];
  }
}
