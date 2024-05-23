// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/cartController.dart';

import 'package:food_ordering_app/src/helper/constants.dart';
import 'package:food_ordering_app/src/screens/add_to_cart_screen.dart';
import 'package:food_ordering_app/src/screens/menu_screen.dart';
import 'package:food_ordering_app/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomwPage extends StatefulWidget {
  int newindex;
  HomwPage({
    Key? key,
    this.newindex = 0,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomwPageState createState() => _HomwPageState();
}

class _HomwPageState extends State<HomwPage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.newindex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? const Icon(Icons.home)
                : const Icon(
                    Icons.home_outlined,
                    size: 24,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? const Icon(Icons.search)
                : const Icon(
                    Icons.search,
                    size: 24,
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Consumer<CartController>(
                        builder: (context, value, child) => Positioned(
                          top: -20,
                          right: -10,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.purple,
                            child: Center(
                              child: Consumer<CartController>(
                                builder: (context, value, child) => customText(
                                  context,
                                  "${value.newCartData.length}",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.shopping_cart),
                    ],
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Consumer<CartController>(
                        builder: (context, value, child) => Positioned(
                          top: -20,
                          right: -10,
                          child: CircleAvatar(
                            radius: 10,
                            child: Center(
                              child: customText(
                                context,
                                "${value.newCartData.length}",
                              ),
                            ),
                            backgroundColor: AppColors.lightgrey,
                          ),
                        ),
                      ),
                      const Icon(Icons.shopping_cart),
                    ],
                  ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? const Icon(Icons.people)
                : const Icon(
                    Icons.person_outline,
                    size: 24,
                  ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return MenuScreen();
      case 1:
        return const Center(child: Text('Invalid Page'));
      case 2:
        return AddToCartScreen();
      case 3:
        return const Center(child: Text('Invalid Page'));
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }
}
