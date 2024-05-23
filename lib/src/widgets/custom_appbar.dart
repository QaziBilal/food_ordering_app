import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../helper/constants.dart';
import 'custom_text.dart';
import 'custom_textfield.dart';

class CustomAppbar extends StatelessWidget {
  String text;
  bool check;
  Function? ontap;
  CustomAppbar({required this.text, this.check = true, this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      scrolledUnderElevation: 0,
      primary: false,
      leadingWidth: 20,
      iconTheme: IconThemeData(color: AppColors.black),
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back_ios),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      title: customText(context, text,
          size: 32, fontWeight: FontWeight.w600, color: AppColors.black),
      actions: [
        if (check == true)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: kIsWeb
                  ? NetworkImage(AppImages.profile)
                  : AssetImage(AppImages.profile) as ImageProvider,
              backgroundColor: Colors.green,
            ),
          )
      ],
    );
  }
}

Widget customContainer(sw, image, {bool check = false}) {
  return Container(
    // width: sw * 0.15,
    // height: sw * 0.15,
    decoration: BoxDecoration(
        gradient: check == false
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    AppColors.firstColor.withOpacity(0.43),
                    AppColors.secondColor.withOpacity(0.0)
                  ])
            : const LinearGradient(
                colors: [AppColors.purple, AppColors.purple]),
        borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.all(15),
    child: kIsWeb
        ? Image.network("assets/$image",
            width: sw * 0.1, height: sw * 0.1, fit: BoxFit.fill)
        : Image.asset(image,
            width: sw * 0.1, height: sw * 0.1, fit: BoxFit.fill),
  );
}

Widget searchTextFeild(searchController) {
  return CustomTextFeild(
    controller: searchController,
    labelText: "Search",
  );
}
