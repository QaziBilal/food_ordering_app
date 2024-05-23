import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/CategoryController.dart';
import 'package:food_ordering_app/src/controller/food_itemController.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:food_ordering_app/src/models/cateogry.dart';
import 'package:food_ordering_app/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import '../widgets/custom_text.dart';
import '../widgets/shimmer.dart';
import 'food_item_detail_screen.dart';

// ignore: must_be_immutable
class FoodItemsScreen extends StatelessWidget {
  CategoryModel1 categoryModel;
  int newindex;
  FoodItemsScreen({required this.categoryModel, this.newindex = -1, super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    final provider = Provider.of<FoodItemController>(context, listen: false);
    provider.fetcgSubCatgory(categoryModel.categoryID);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Consumer<CategoryController>(
          builder: (context, value, child) => Column(
            children: [
              CustomAppbar(
                text: newindex == -1
                    ? "${value.categoryList1[value.selectedCategoryIndex].categoryName}"
                    : "${categoryModel.categoryName}",
                // text: newindex == -1
                //     ? categoriesList[value.selectedCategoryIndex].categoryName
                //     : categoryModel.categoryName,
                check: false,
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: searchTextFeild(searchController),
              ),
              20.height,
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.13,
                child: Consumer<CategoryController>(
                    builder: (context, value, child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.categoryList1.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    newindex = -1;
                                    value.setSelectedCategoryIndex(index);
                                    // print(
                                    //     "Id = ${value.categoryList1[index].categoryID}");
                                    provider.fetcgSubCatgory(
                                        value.categoryList1[index].categoryID);
                                  },
                                  child: customContainer(sw,
                                      value.categoryList1[index].categoryImage,
                                      check: newindex == -1
                                          ? value.selectedCategoryIndex == index
                                              ? true
                                              : false
                                          : newindex == index
                                              ? true
                                              : false)),
                              (sw * 0.02).height,
                              customText(context,
                                  "${value.categoryList1[index].categoryName}",
                                  color: AppColors.textFeildColor,
                                  size: 14,
                                  fontWeight: FontWeight.w300)
                            ],
                          ),
                        );
                      });
                }),
              ),
              gridView(sw)
            ],
          ),
        ),
      ),
    );
  }

  Widget gridView(sw) {
    return Consumer<FoodItemController>(builder: (context, value, child) {
      if (value.isloading == true) {
        return NewsListShimmer(
          list: true,
        );
      } else {
        return Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.only(
                top: 0,
                left: 20,
                right: 20,
              ),
              shrinkWrap: true,
              itemCount: value.listNew.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // provider.detailScreenItem(foodItmes[index]);
                        // print("Id = ${value.listNew[index].categoryID}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDetailScreen(
                                    foodItemModel1: value.listNew[index])));
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  AppColors.firstColor.withOpacity(0.21),
                                  AppColors.firstColor.withOpacity(0.18)
                                ])),
                            child: SizedBox(
                              width: sw * 0.23,
                              height: sw * 0.23,
                              child: kIsWeb
                                  ? Image.network(
                                      "assets/${value.listNew[index].foodItemImage}",
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      value.listNew[index].foodItemImage!,
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                          // if (foodItmes[index].plus == true)
                          //   Positioned(
                          //       bottom: -5,
                          //       right: -5,
                          //       child: CircleAvatar(
                          //         radius: 10,
                          //         backgroundColor: AppColors.lightGreen,
                          //         child: Center(
                          //             child: Icon(
                          //           Icons.add,
                          //           size: 14,
                          //           color: AppColors.white,
                          //         )),
                          //       ))
                        ],
                      ),
                    ),
                    15.height,
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            value.listNew[index].foodItemName!,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.style.copyWith(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.black),
                          ),
                          customText(
                              context, "Rs. ${value.listNew[index].price}",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGreen),
                        ],
                      ),
                    )
                  ],
                );
              }),
        );
      }
    });
  }
}
