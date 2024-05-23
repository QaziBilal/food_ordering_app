import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/cartController.dart';
import 'package:food_ordering_app/src/helper/constants.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:food_ordering_app/src/models/cartModel.dart';
import 'package:food_ordering_app/src/models/cateogry.dart';
import 'package:food_ordering_app/src/models/food_item.dart';
import 'package:food_ordering_app/src/screens/home_screen.dart';
import 'package:food_ordering_app/src/widgets/custom_appbar.dart';
import 'package:food_ordering_app/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../widgets/button.dart';

// ignore: must_be_immutable
class FoodDetailScreen extends StatelessWidget {
  FoodItemModel1 foodItemModel1;
  FoodDetailScreen({required this.foodItemModel1, super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        elevation: 4,
        shadowColor: AppColors.purple.withOpacity(0.7),
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Container(
          width: sw,
          height: sh,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.purple,
                AppColors.purple.withOpacity(0.3)
              ])),
          child: content(context, sw, sh, foodItemModel1)),
    );
  }

  Widget content(context, sw, sh, FoodItemModel1 item) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: sw * 0.7,
              height: sh * 0.35,
              child: kIsWeb
                  ? Image.network(
                      "assets/${item.foodItemImage}",
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "${item.foodItemImage}",
                      fit: BoxFit.contain,
                    ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            width: sw,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.purple),
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          5.width,
                          customText(context, "4.8",
                              size: 22, fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                    customText(context, "Rs. ${item.price}",
                        fontWeight: FontWeight.w700,
                        size: 25,
                        color: AppColors.lightGreen1)
                  ],
                ),
                30.height,
                Consumer<CartController>(
                  builder: (context, quantity, child) => Row(
                    children: [
                      customText(context, item.foodItemName,
                          size: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            quantity.updateQuantity(false);
                          },
                          child: circleIcon(Icons.remove)),
                      20.width,
                      Text(
                        "${quantity.quantity}",
                        style: TextStyles.style
                            .copyWith(fontSize: 20, color: AppColors.black),
                      ),
                      20.width,
                      InkWell(
                          onTap: () {
                            quantity.updateQuantity(true);
                          },
                          child: circleIcon(Icons.add))
                    ],
                  ),
                ),
                20.height,
                customText(context,
                    "A well-seasoned, crispy Zinger filled with Tomatoes, onions,Cheddar cheese,lettuce&Special sauce!",
                    size: 14,
                    color: AppColors.textFeildColor,
                    textAlign: TextAlign.left),
                40.height,
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: customText(context, "Add Ons",
                          size: 16, color: AppColors.black),
                    ),
                    10.height,
                    Container(
                        alignment: Alignment.center,
                        height: sw * 0.2,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (int i = 0;
                                i <= addOnsList.length - 1;
                                i++) ...[
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  customContainer(
                                    sw,
                                    addOnsList[i].categoryImage,
                                  ),
                                  Positioned(
                                      bottom: -5,
                                      right: -5,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: AppColors.lightGreen,
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          size: 14,
                                          color: AppColors.white,
                                        )),
                                      ))
                                ],
                              ),
                              20.width,
                            ]
                          ],
                        )),
                  ],
                ),
                const Spacer(),
                Consumer<CartController>(
                  builder: (context, cart, child) => cart.isloading == true
                      ? Container(
                          height: 60,
                          width: 60,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : button(context, "Add To Cart", () {
                          // cart.setCartListItems(item);
                          int price = item.price!;
                          int quantity = cart.quantity;
                          cart.addtoCart(CartModel1(
                            quantity: quantity,
                            fooditemId: item.foodiItemId!,
                          ));

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomwPage(
                                        newindex: 2,
                                      )));
                        }, width: sw),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<CategoryModel> addOnsList = [
    CategoryModel(
      categoryID: 1,
      categoryName: "Cheese",
      categoryImage: AppImages.cheese,
      foodItems: [],
    ),
    CategoryModel(
      categoryID: 1,
      categoryName: "Ketchup",
      categoryImage: AppImages.ketchup,
      foodItems: [],
    ),
    CategoryModel(
      categoryID: 1,
      categoryName: "Mayo",
      categoryImage: AppImages.mayo,
      foodItems: [],
    ),
  ];
}

Widget circleIcon(IconData icon) {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.purple, width: 2),
        shape: BoxShape.circle),
    child: Center(
        child: Icon(
      icon,
      size: 15,
      color: AppColors.purple,
    )),
  );
}
