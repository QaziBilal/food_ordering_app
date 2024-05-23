import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/helper/constants.dart';

class CustomTextFeild extends StatefulWidget {
  String prefixIcon;
  String suffixIcon;
  TextEditingController controller;
  String labelText;
  bool obscureText;
  double width;
  double height;
  bool grey;
  var maxlines;
  bool color;
  final Function? ontap;

  CustomTextFeild(
      {this.prefixIcon = "",
      this.labelText = "",
      required this.controller,
      this.suffixIcon = "",
      this.obscureText = false,
      this.width = 20,
      this.height = 20,
      this.maxlines = 1,
      this.ontap,
      this.grey = false,
      this.color = true,
      super.key});

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
          color: widget.color ? AppColors.lightgrey : AppColors.white,
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: AppColors.black,
        controller: widget.controller,
        style: TextStyles.style.copyWith(fontSize: 20, color: AppColors.black),
        maxLines: widget.maxlines,
        decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: widget.labelText,
            hintStyle: TextStyles.style
                .copyWith(fontSize: 20, color: AppColors.textFeildColor),
            prefixIconConstraints: const BoxConstraints(
                maxHeight: 30, maxWidth: 30, minHeight: 20, minWidth: 20),
            prefixIcon: widget.color
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.search,
                      color: AppColors.textFeildColor,
                      size: 20,
                    ),
                  )
                : null),
        obscureText: widget.obscureText,
      ),
    );
  }
}
