import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/cartController.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:food_ordering_app/src/screens/home_screen.dart';
import 'package:food_ordering_app/src/widgets/custom_text.dart';
import 'package:food_ordering_app/src/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import '../helper/constants.dart';
import '../widgets/button.dart';
import '../widgets/shimmer.dart';
import 'food_item_detail_screen.dart';

class AddToCartScreen extends StatelessWidget {
  AddToCartScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartController>(context, listen: false);
    cartProvider.getCartAndFooItemDatainList();
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<CartController>(
                builder: (context, cart, child) => customText(
                    context, "${cart.newCartData.length} Items in cart",
                    size: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black),
              ),
              10.height,
              cartItemsList(context, sw),
              bottomContent(context, sw)
            ],
          ),
        ),
      ),
    );
  }

  Widget cartItemsList(context, sw) {
    return Expanded(
      child: Consumer<CartController>(builder: (context, cart, child) {
        if (cart.newCartData.isEmpty) {
          return Center(
            child: customText(context, "Cart is Empty",
                size: 25, color: AppColors.purple, fontWeight: FontWeight.w700),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cart.newCartData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      width: sw * 0.25,
                      height: sw * 0.3,
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.firstColor.withOpacity(0.43),
                                AppColors.secondColor.withOpacity(0.0)
                              ]),
                          borderRadius: BorderRadius.circular(15)),
                      child: kIsWeb
                          ? Image.network(
                              "${cart.newCartData[index].foodItemModel1.foodItemImage}")
                          : Image.asset(
                              "${cart.newCartData[index].foodItemModel1.foodItemImage}",
                              fit: BoxFit.contain,
                            ),
                      // child: kIsWeb
                      //     ? Image.network(
                      //         cart.cartList[index].foodItem.foodItemImage)
                      //     : Image.asset(
                      //         cart.cartList[index].foodItem.foodItemImage,
                      //         fit: BoxFit.contain,
                      //       ),
                    ),
                    15.width,
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${cart.newCartData[index].foodItemModel1.foodItemName}",
                            // "${cart.cartList1[index].fooditemId}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.style.copyWith(
                              fontSize: 22,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          customText(context,
                              "Rs. ${cart.newCartData[index].foodItemModel1.price}",
                              size: 22,
                              color: AppColors.lightGreen1,
                              fontWeight: FontWeight.w500),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    cart.updateQuantityinCart(
                                        false,
                                        index,
                                        cart.newCartData[index].cartModel1
                                            .cartId);
                                    // cart.updateQuantityinDatabase(
                                    //     cart.newCartData[index].cartModel1
                                    //         .cartId,
                                    //     false,
                                    //     index);
                                    // cart.getCartAndFooItemDatainList();

                                    // cart.updateQuantityinCartList(false, index);
                                  },
                                  child: circleIcon(Icons.remove)),
                              20.width,
                              Text(
                                "${cart.newCartData[index].cartModel1.quantity}",
                                style: TextStyles.style.copyWith(
                                    fontSize: 20, color: AppColors.black),
                              ),
                              20.width,
                              InkWell(
                                  onTap: () {
                                    cart.updateQuantityinCart(
                                        true,
                                        index,
                                        cart.newCartData[index].cartModel1
                                            .cartId);

                                    // cart.updateQuantityinDatabase(
                                    //     cart.newCartData[index].cartModel1
                                    //         .cartId,
                                    //     true,
                                    //     index);
                                    // cart.getCartAndFooItemDatainList();
                                  },
                                  child: circleIcon(Icons.add))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    cart.isloading == true
                        ? SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator())
                        : InkWell(
                            onTap: () {
                              // cart.removeCartItem(cart.cartList[index]);
                              cart.deleteCartItem(
                                  cart.newCartData[index].cartModel1.cartId);
                              cart.getCartAndFooItemDatainList();
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red, width: 2),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Icon(
                                Icons.close,
                                size: 15,
                                color: AppColors.black,
                              )),
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }

  Widget bottomContent(context, sw) {
    return Column(
      children: [
        customText(context, "Order Instrcutions",
            size: 22, color: AppColors.black, fontWeight: FontWeight.w500),
        Sizedboxes.sizedBoxHeight(height: 10),
        Container(
          height: 45,
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff989595)),
              borderRadius: BorderRadius.circular(17)),
          child: CustomTextFeild(
            controller: controller,
            color: false,
            labelText: "Order Instructions",
          ),
        ),
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(context, "Total :",
                size: 22, color: AppColors.black, fontWeight: FontWeight.w600),
            Consumer<CartController>(builder: (context, cart, child) {
              return customText(context, "Rs. ${cart.getTotalPrice()}",
                  size: 22,
                  color: AppColors.lightGreen1,
                  fontWeight: FontWeight.w600);
            }),
          ],
        ),
        10.height,
        button(context, "Checkout", addtoCartButton, width: sw),
        10.height,
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomwPage(
                            newindex: 0,
                          )));
            },
            child: customText(context, "Back to Menu",
                size: 22, color: AppColors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  void addtoCartButton() {}
}
