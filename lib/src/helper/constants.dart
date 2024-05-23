import 'package:flutter/material.dart';

class AppColors {
  static Color white = const Color(0xffFFFFFF);
  static const Color purple = const Color(0xff721CC7);
  static Color black = const Color(0xff000000);
  static Color lightGreen = const Color(0xff626C23);
  static Color lightgrey = const Color(0xffF5F5F5);

  static Color textFeildColor = const Color(0xff989595);

  static Color firstColor = const Color(0xffD3C7DF);
  static Color secondColor = const Color(0xff7E3EBE);

  static Color lightGreen1 = const Color(0xffC9CC45);
}

String imagePath = "assets/images";

class AppImages {
  static String mixedfood = "$imagePath/mixed-food.png";
  static String burger1 = "$imagePath/burger1.png";
  static String burger2 = "$imagePath/burger2.png";
  static String burger3 = "$imagePath/burger3.png";
  static String burger4 = "$imagePath/burger4.png";
  static String burger5 = "$imagePath/burger5.png";
  static String burger6 = "$imagePath/burger6.png";
  static String burger7 = "$imagePath/burger7.png";
  static String pizza1 = "$imagePath/pizza1.png";
  static String pizza2 = "$imagePath/pizza2.png";
  static String pizza3 = "$imagePath/pizza3.png";
  static String pizza4 = "$imagePath/pizza4.png";
  static String pizza5 = "$imagePath/pizza5.png";
  static String pizza6 = "$imagePath/pizza6.png";
  static String pizza7 = "$imagePath/pizza7.png";
  static String dessert1 = "$imagePath/dessert1.png";
  static String dessert2 = "$imagePath/dessert2.png";
  static String dessert3 = "$imagePath/dessert3.png";
  static String dessert4 = "$imagePath/dessert4.png";
  static String dessert5 = "$imagePath/dessert5.png";
  static String dessert6 = "$imagePath/dessert6.png";
  static String dessert7 = "$imagePath/dessert7.png";
  static String fries = "$imagePath/fries.png";
  static String cheese = "$imagePath/cheese.png";
  static String ketchup = "$imagePath/ketchup.png";
  static String mayo = "$imagePath/mayo.png";
  static String profile = "$imagePath/profile.png";
}

class TextStyles {
  static TextStyle style = TextStyle(fontFamily: "Poppins");
}

class Sizedboxes {
  static Widget sizedBoxWidth({required double width}) {
    return SizedBox(
      width: width,
    );
  }

  static Widget sizedBoxHeight({required double height}) {
    return SizedBox(
      height: height,
    );
  }
}
