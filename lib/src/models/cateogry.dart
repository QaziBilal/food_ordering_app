import 'package:food_ordering_app/src/models/food_item.dart';

class CategoryModel {
  int categoryID;
  String categoryName;
  String categoryImage;
  List<FoodItemModel> foodItems;
  CategoryModel(
      {required this.categoryID,
      required this.categoryName,
      required this.categoryImage,
      required this.foodItems});
}

class CategoryModel1 {
  int? categoryID;
  String? categoryName;
  String? categoryImage;

  CategoryModel1({
    this.categoryID,
    this.categoryName,
    this.categoryImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryID': categoryID,
      'categoryName': categoryName,
      'categoryImage': categoryImage,
    };
  }

  CategoryModel1.fromMap(Map<String, dynamic> map) {
    categoryID = map['categoryId'];
    categoryName = map['categoryName'];
    categoryImage = map['categoryImage'];
  }

  // factory CategoryModel1.fromMap(Map<String, dynamic> map) {
  //   return CategoryModel1(
  //     categoryID: map['categoryID'],
  //     categoryName:
  //         map['categoryName'] != null ? map['categoryName'] as String : null,
  //     categoryImage:
  //         map['categoryImage'] != null ? map['categoryImage'] as String : null,
  //   );
  // }
}
