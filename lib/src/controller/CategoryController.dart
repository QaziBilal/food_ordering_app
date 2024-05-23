import 'package:flutter/foundation.dart';
import 'package:food_ordering_app/src/Database/categoriesTable.dart';
import 'package:food_ordering_app/src/helper/dummy_data.dart';
import 'package:food_ordering_app/src/models/cateogry.dart';

class CategoryController extends ChangeNotifier {
  int _selectedCategoryindex = -1;
  int get selectedCategoryIndex => _selectedCategoryindex;

  List<CategoryModel> _categoriesList = categoriesList;
  List<CategoryModel> get categoryList => _categoriesList;

  List<CategoryModel1> _categoriesList1 = [];
  List<CategoryModel1> get categoryList1 => _categoriesList1;

  bool isloading = false;

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryindex = index;

    notifyListeners();
  }

  void getCategoryList(List<CategoryModel> categories) {
    _categoriesList = categories;
    notifyListeners();
  }

  // Future<void> addCategory(String name, File? image) async {
  //   if (image == null) {
  //     print("Image is null");
  //   } else {
  //     final List<int> imagepath = await image!.readAsBytes();

  //     await CategorySqlHelper.saveCategory(name, imagepath);
  //   }
  // }
  Future<void> addCategory(CategoryModel categoryModel) async {
    await CategorySqlHelper.saveCategory(categoryModel);

    isloading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    isloading = true;
    // notifyListeners();
    final List<Map<String, dynamic>> categories =
        await CategorySqlHelper.getCategories();

    _categoriesList1 = categories.map((categoryMap) {
      print("categoryID =  ${categoryMap}");
      return CategoryModel1.fromMap(categoryMap);
    }).toList();
    isloading = false;
    notifyListeners();
  }
}
