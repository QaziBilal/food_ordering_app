import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/CategoryController.dart';
import 'package:food_ordering_app/src/controller/food_itemController.dart';
import 'package:food_ordering_app/src/helper/constants.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:food_ordering_app/src/models/food_item.dart';
import 'package:food_ordering_app/src/screens/food_item_detail_screen.dart';
import 'package:food_ordering_app/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../models/cateogry.dart';
import '../widgets/custom_text.dart';
import '../widgets/shimmer.dart';
import 'food_item_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryController>(context, listen: false);
    provider.fetchCategories();
    final foodItemProvider =
        Provider.of<FoodItemController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      foodItemProvider.fetcgSubCatgory(1);
    });

    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              text: "Menu",
              check: true,
            ),
            20.height,
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: searchTextFeild(_searchController),
            ),
            20.height,
            Consumer<CategoryController>(builder: (context, value, child) {
              List<CategoryModel1> categoriesListfromProvider =
                  value.categoryList1;
              return categoriesListView(
                  sw, categoriesListfromProvider, context);
            }),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                shrinkWrap: true,
                children: [
                  listViewContent(context, sw),
                  20.height,
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: customText(context, "popular",
                          size: 25,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500)),
                  Sizedboxes.sizedBoxHeight(height: 10),
                  Consumer<FoodItemController>(
                      builder: (context, value, child) {
                    List<FoodItemModel1> popularFood = value.listNew;
                    return gridview(context, sw, popularList: popularFood);
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriesListView(sw, categoriesListfromProvider, context) {
    return Consumer<CategoryController>(builder: (context, value, child) {
      if (value.isloading == true) {
        return NewsListShimmer(
          list: true,
        );
      } else {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.13,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesListfromProvider.length,
              itemBuilder: (context, index) {
                CategoryModel1 category = categoriesListfromProvider[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            print("ID = ${category.categoryID}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodItemsScreen(
                                          categoryModel: category,
                                          newindex: index,
                                        )));
                          },
                          child: customContainer(sw, category.categoryImage)),
                      10.height,
                      customText(context, category.categoryName,
                          color: AppColors.textFeildColor,
                          size: 14,
                          fontWeight: FontWeight.w300)
                    ],
                  ),
                );
              }),
        );
      }
    });
  }

  Widget listViewContent(context, sw) {
    return Stack(
      children: [
        Column(
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: customText(context, "Promotions",
                    size: 25,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500)),
            10.height,
            Container(
              padding: EdgeInsets.only(
                  left: 20, right: sw * 0.3, top: 20, bottom: 20),
              width: sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.purple.withOpacity(0.92),
                        AppColors.purple.withOpacity(0.55)
                      ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(context, "Todays Offers",
                      size: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                  customText(context, "Free Box Office",
                      size: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                  customText(context, "on all orders above Rs.5999",
                      size: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left)
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: -2,
            right: -5,
            child: Container(
              width: sw * 0.4,
              height: sw * 0.35,
              child: kIsWeb
                  ? Image.network(
                      "assets/${AppImages.fries}",
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      AppImages.fries,
                      fit: BoxFit.contain,
                    ),
            ))
      ],
    );
  }

  Widget gridview(
    context,
    sw, {
    required List<FoodItemModel1> popularList,
    bool check = false,
  }) {
    final provider = Provider.of<FoodItemController>(context, listen: false);
    if (provider.isloading == true) {
      return NewsListShimmer(
        list: false,
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: check
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: popularList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          FoodItemModel1 popularItem = popularList[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                AppColors.firstColor.withOpacity(0.21),
                AppColors.firstColor.withOpacity(0.18)
              ]),
            ),
            child: InkWell(
              onTap: () {
                // provider.detailScreenItem(popularItem);
                print(
                    "foodid =  ${popularList[index].foodiItemId} and categoryId = ${popularList[index].categoryID}");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetailScreen(
                              foodItemModel1: popularList[index],
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: sw * 0.3,
                    height: sw * 0.3,
                    child: kIsWeb
                        ? Image.network(
                            "assets/${popularItem.foodItemImage}",
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "${popularItem.foodItemImage}",
                            fit: BoxFit.contain,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${popularItem.foodItemName}",
                                style: TextStyles.style.copyWith(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                              customText(context, "Rs. ${popularItem.price}",
                                  size: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.lightGreen),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.lightGreen,
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: AppColors.white,
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
      // }
      // },
      // );
    }
  }
}
