import '../models/cateogry.dart';
import '../models/food_item.dart';
import 'constants.dart';

List<FoodItemModel> popularFoodList = [
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Zinger Burger",
      foodItemImage: AppImages.burger2,
      price: 120),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 1,
    foodItemName: "Chicken Burger",
    foodItemImage: AppImages.burger3,
    price: 100,
  ),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Pizza",
      foodItemImage: AppImages.pizza1,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "italian Pizza",
      foodItemImage: AppImages.pizza4,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Burger ",
      foodItemImage: AppImages.burger5,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Desert",
      foodItemImage: AppImages.dessert2,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Dessert",
      foodItemImage: AppImages.dessert4,
      price: 120),
];

List<FoodItemModel> burgersList = [
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Zinger Burger",
      foodItemImage: AppImages.burger1,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 2,
      categoryID: 1,
      foodItemName: "Chicken Burger",
      foodItemImage: AppImages.burger2,
      plus: true,
      price: 100),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "New Burger",
      foodItemImage: AppImages.burger3,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Anda Burger",
      foodItemImage: AppImages.burger4,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Burger ",
      foodItemImage: AppImages.burger5,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Black Burger",
      foodItemImage: AppImages.burger6,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Burger This",
      foodItemImage: AppImages.burger7,
      price: 120),
];
List<FoodItemModel> pizzaList = [
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Tandoori Pizza",
      foodItemImage: AppImages.pizza2,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 2,
      categoryID: 1,
      foodItemName: "All Pizza",
      foodItemImage: AppImages.pizza3,
      price: 100),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Pizza",
      foodItemImage: AppImages.pizza1,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "italian Pizza",
      foodItemImage: AppImages.pizza4,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Fajita Pizza ",
      foodItemImage: AppImages.pizza5,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Kabab Pizza",
      foodItemImage: AppImages.pizza6,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Any Pizza",
      foodItemImage: AppImages.pizza7,
      price: 120),
];
List<FoodItemModel> dessertList = [
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Dessert",
      foodItemImage: AppImages.dessert1,
      price: 120),
  FoodItemModel(
      foodiItemId: 2,
      categoryID: 1,
      foodItemName: "Ice Cream",
      foodItemImage: AppImages.dessert2,
      plus: true,
      price: 100),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Halwa",
      foodItemImage: AppImages.dessert3,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Kheer",
      foodItemImage: AppImages.dessert4,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Cup Cake",
      foodItemImage: AppImages.dessert5,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "New Dessert",
      foodItemImage: AppImages.dessert6,
      plus: true,
      price: 120),
  FoodItemModel(
      foodiItemId: 1,
      categoryID: 1,
      foodItemName: "Dessert Png",
      foodItemImage: AppImages.dessert7,
      price: 120),
];

List<CategoryModel> categoriesList = [
  CategoryModel(
      categoryID: 1,
      categoryName: "All",
      categoryImage: AppImages.mixedfood,
      foodItems: popularFoodList),
  CategoryModel(
      categoryID: 2,
      categoryName: "Burger",
      categoryImage: AppImages.burger1,
      foodItems: burgersList),
  CategoryModel(
      categoryID: 3,
      categoryName: "Pizza",
      categoryImage: AppImages.pizza1,
      foodItems: pizzaList),
  CategoryModel(
      categoryID: 4,
      categoryName: "Desserts",
      categoryImage: AppImages.dessert1,
      foodItems: dessertList),
];

List<CategoryModel> newCategoriesList = [
  CategoryModel(
      categoryID: 1,
      categoryName: "All",
      categoryImage: AppImages.mixedfood,
      foodItems: allList),
  CategoryModel(
      categoryID: 2,
      categoryName: "Burger",
      categoryImage: AppImages.burger1,
      foodItems: burger),
  CategoryModel(
      categoryID: 3,
      categoryName: "Dessert",
      categoryImage: AppImages.dessert4,
      foodItems: deseert),
  CategoryModel(
      categoryID: 4,
      categoryName: "Pizza",
      categoryImage: AppImages.pizza4,
      foodItems: pizza),
];

List<FoodItemModel> allList = [
  FoodItemModel(
    foodiItemId: 1,
    categoryID: 1,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger1,
    price: 120,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 1,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza1,
    price: 120,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 1,
    foodItemName: "Deseert",
    foodItemImage: AppImages.dessert1,
    price: 120,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 1,
    foodItemName: "Desseert",
    foodItemImage: AppImages.dessert6,
    price: 120,
  ),
  FoodItemModel(
    foodiItemId: 5,
    categoryID: 1,
    foodItemName: "Pizzzza",
    foodItemImage: AppImages.pizza4,
    price: 120,
  ),
  FoodItemModel(
    foodiItemId: 6,
    categoryID: 1,
    foodItemName: "Burguer",
    foodItemImage: AppImages.burger7,
    price: 120,
  ),
];
List<FoodItemModel> burger = [
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger1,
    price: 300,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger2,
    price: 300,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger3,
    price: 300,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger4,
    price: 300,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger5,
    price: 300,
  ),
  FoodItemModel(
    foodiItemId: 2,
    categoryID: 2,
    foodItemName: "Burger",
    foodItemImage: AppImages.burger6,
    price: 300,
  ),
];
List<FoodItemModel> deseert = [
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert1,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert2,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert3,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert4,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert5,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert6,
    price: 200,
  ),
  FoodItemModel(
    foodiItemId: 3,
    categoryID: 3,
    foodItemName: "Desert",
    foodItemImage: AppImages.dessert7,
    price: 200,
  ),
];
List<FoodItemModel> pizza = [
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza1,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza2,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza3,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza4,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza5,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza6,
    price: 280,
  ),
  FoodItemModel(
    foodiItemId: 4,
    categoryID: 4,
    foodItemName: "Pizza",
    foodItemImage: AppImages.pizza7,
    price: 280,
  ),
];
