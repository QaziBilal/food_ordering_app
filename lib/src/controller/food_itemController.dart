import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/src/Database/foodItemTable.dart';
import 'package:food_ordering_app/src/helper/dummy_data.dart';
import 'package:food_ordering_app/src/models/food_item.dart';

class FoodItemController extends ChangeNotifier {
  List<FoodItemModel> _popularFoodItemList = popularFoodList;

  List<FoodItemModel> get poplarFoodItemsList => _popularFoodItemList;

  List<FoodItemModel1> _listNew = [];

  List<FoodItemModel1> get listNew => _listNew;

  late FoodItemModel _foodItemModel;

  FoodItemModel get foodItem => _foodItemModel;

  late FoodItemModel1 _foodItemModel1;

  FoodItemModel1 get foodItem1 => _foodItemModel1;

  bool isloading = false;

  void detailScreenItem(FoodItemModel itemModel) {
    _foodItemModel = itemModel;
    notifyListeners();
  }

  void getPopularFoodItemList(List<FoodItemModel> list) {
    _popularFoodItemList = list;
    notifyListeners();
  }

  Future<void> saveSubCategory(int categoryId, FoodItemModel food_item) async {
    await FoodItemSqlHelper.insertFoodItem(categoryId, food_item);
    notifyListeners();
  }

  Future<void> fetcgSubCatgory(int? categoryId) async {
    // isloading = true;
    // notifyListeners();
    final List<Map<String, dynamic>> fooditems =
        await FoodItemSqlHelper.getFoodItems(categoryId);

    _listNew = fooditems.map((foodCategory) {
      return FoodItemModel1.fromMap(foodCategory);
    }).toList();
    isloading = false;
    notifyListeners();
  }
}
