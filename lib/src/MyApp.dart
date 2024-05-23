import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/controller/CategoryController.dart';
import 'package:food_ordering_app/src/controller/cartController.dart';
import 'package:food_ordering_app/src/controller/food_itemController.dart';
import 'package:food_ordering_app/src/controller/imageProvider.dart';
import 'package:food_ordering_app/src/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => FoodItemController()),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => ImageController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
