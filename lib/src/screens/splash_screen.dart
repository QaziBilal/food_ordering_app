import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/CategoryController.dart';
import 'package:food_ordering_app/src/controller/food_itemController.dart';
import 'package:food_ordering_app/src/helper/constants.dart';
import 'package:food_ordering_app/src/helper/dummy_data.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:food_ordering_app/src/screens/NewScreens/add_foodItem.dart';
import 'package:food_ordering_app/src/screens/home_screen.dart';
import 'package:food_ordering_app/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../widgets/button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryController>(context, listen: false);
    final foodItemProvider =
        Provider.of<FoodItemController>(context, listen: false);

    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppColors.purple,
              AppColors.purple,
              AppColors.purple.withOpacity(0.3)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: sw * 0.4,
                backgroundColor: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: sw * 0.1, left: sw * 0.04),
                  child: kIsWeb
                      ? Image.network(
                          "assets/${AppImages.mixedfood}",
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          AppImages.mixedfood,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ),
            Sizedboxes.sizedBoxHeight(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: customText(context, "Enjoy Your Food",
                  fontWeight: FontWeight.w700,
                  size: 50,
                  fontstyle: FontStyle.italic),
            ),
            Sizedboxes.sizedBoxHeight(height: 20),

            button(context, "Get Started", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomwPage()));
            },
                width: sw * 0.7,
                color: AppColors.white,
                radius: 40,
                check: true),

            20.height,
            if (categoryProvider.isloading == false) ...[
              button(context, "Add Data", () {
                newCategoriesList.forEach((element) {
                  categoryProvider.addCategory(element);

                  print("category added");
                  element.foodItems.forEach((items) {
                    foodItemProvider.saveSubCategory(element.categoryID, items);
                    print("FoodItems Added");
                  });
                });
                final snackBar = SnackBar(
                    backgroundColor: AppColors.white,
                    content: Text(
                      "Data Added",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontFamily: "Poppins"),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomwPage()));
              },
                  width: sw * 0.7,
                  color: AppColors.black,
                  radius: 40,
                  check: false),
            ] else ...[
              SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator())
            ],
            20.height,
            // button(context, "Add Category", () {

            //   // Navigator.push(context,
            //   //     MaterialPageRoute(builder: (context) => AddCategoryScreen()));
            // }, width: sw * 0.7, radius: 40, color: AppColors.black),
            // button(context, "Add Food Item", () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => AddFoodItem()));
            // }, width: sw * 0.7, radius: 40, color: AppColors.black)
          ],
        ),
      ),
    );
  }
}
