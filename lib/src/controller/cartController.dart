import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/Database/cartTable.dart';
import 'package:food_ordering_app/src/models/food_item.dart';

import '../models/cartModel.dart';

class CartController extends ChangeNotifier {
  int _quantity = 1;
  int get quantity => _quantity;

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  List<CartModel1> _cartList1 = [];
  List<CartModel1> get cartList1 => _cartList1;

  List<FoodItemInCart> _newCartData = [];
  List<FoodItemInCart> get newCartData => _newCartData;

  bool isloading = false;

  void updateQuantity(bool updateAction) {
    if (updateAction == true) {
      if (_quantity > 4) {
      } else {
        _quantity++;
      }
    } else {
      if (_quantity < 2) {
      } else {
        _quantity--;
      }
    }
    notifyListeners();
  }

  void setCartListItems(FoodItemModel foodItem) {
    for (var cartItem in cartList) {
      if (cartItem.foodItem == foodItem) {
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }
    CartModel cartItem = CartModel(
        cartId: 1,
        quantity: _quantity,
        foodItem: foodItem,
        totalPrice: (foodItem.price * _quantity).toDouble());

    _cartList.add(cartItem);
    _quantity = 1;
    notifyListeners();
  }

  void updateQuantityinCartList(bool update, index) {
    if (update == true) {
      if (_cartList[index].quantity > 4) {
      } else {
        _cartList[index].quantity++;
      }
    } else {
      if (_cartList[index].quantity < 2) {
      } else {
        _cartList[index].quantity--;
      }
    }

    _cartList[index].totalPrice =
        _cartList[index].quantity * _cartList[index].foodItem.price.toDouble();
    notifyListeners();
  }

  void removeCartItem(CartModel cartModel) {
    _cartList.remove(cartModel);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in _newCartData) {
      int price = cartItem.cartModel1.quantity * cartItem.foodItemModel1.price!;

      totalPrice += price;
    }
    // for (var cartItem in _newCartData) {
    //   totalPrice += cartItem.cartModel1.totalPrice;
    // }
    return totalPrice;
  }

  //Database
  Future<void> addtoCart(CartModel1 cartModel1) async {
    isloading = true;
    notifyListeners();
    await CartSqlHelper.saveCart(cartModel1);
    _quantity = 1;

    isloading = false;
    notifyListeners();
  }

  Future<void> fetchCart() async {
    final List<Map<String, dynamic>> cart = await CartSqlHelper.getCart();

    _cartList1 = cart.map((cartItem) {
      print("Cart = ${cartItem}");
      return CartModel1.fromMap(cartItem);
    }).toList();
    notifyListeners();
  }

  Future<void> getCartAndFooItemDatainList() async {
    final List<Map<String, dynamic>> cartData =
        await CartSqlHelper.getCartAndFooItemData();
    print("Data = ${cartData}");

    _newCartData = List.generate(cartData.length, (index) {
      return FoodItemInCart(
          foodItemModel1: FoodItemModel1.fromMap(cartData[index]),
          cartModel1: CartModel1.fromMap(cartData[index]));
    });
    isloading = false;
    notifyListeners();
  }

  Future<void> deleteCartItem(int cartId) async {
    await CartSqlHelper.deleteCart(cartId);
    fetchCart();
    notifyListeners();
  }

  void updateQuantityinCart(bool update, index, int cartId) {
    if (update == true) {
      if (_newCartData[index].cartModel1.quantity >= 5) {
      } else {
        _newCartData[index].cartModel1.quantity++;
        updateQuantityinDatabase(
            cartId, index, _newCartData[index].cartModel1.quantity);
      }
    } else {
      if (_newCartData[index].cartModel1.quantity <= 1) {
      } else {
        _newCartData[index].cartModel1.quantity--;
        updateQuantityinDatabase(
            cartId, index, _newCartData[index].cartModel1.quantity);
      }
    }

    notifyListeners();
  }

  Future<void> updateQuantityinDatabase(int cartId, int index, quantity) async {
    await CartSqlHelper.updateCart(cartId, quantity);
    isloading = false;
    notifyListeners();
  }
}
