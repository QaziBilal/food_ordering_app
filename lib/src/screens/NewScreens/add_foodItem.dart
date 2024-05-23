import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
import 'package:provider/provider.dart';

import '../../controller/imageProvider.dart';
import '../../helper/constants.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class AddFoodItem extends StatelessWidget {
  AddFoodItem({super.key});
  TextEditingController foodItemName = TextEditingController();
  TextEditingController foodItemPrice = TextEditingController();
  String selectedOption = 'Select Category';

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageController>(context);
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(sw, 100),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomAppbar(
              text: "Add Food Item",
              check: false,
            ),
          )),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                imageProvider.pickImage();
              },
              child: Container(
                width: sw * 0.5,
                height: sw * 0.5,
                padding:
                    const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textFeildColor),
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.white),
                child: imageProvider.selectedImage != null
                    ? Image.file(
                        imageProvider.selectedImage!.absolute,
                        height: sw * 0.3,
                      )
                    : Center(child: customText(context, "Select Image")),
              ),
            ),
            10.height,
            Container(
              height: 45,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff989595)),
                  borderRadius: BorderRadius.circular(17)),
              child: CustomTextFeild(
                controller: foodItemName,
                color: false,
                labelText: "Food Name",
              ),
            ),
            10.height,
            Container(
              height: 45,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff989595)),
                  borderRadius: BorderRadius.circular(17)),
              child: DropdownButton<String>(
                padding: EdgeInsets.only(left: 10),
                value: selectedOption,
                onChanged: (newValue) {},
                isExpanded: true,
                underline: Container(),
                style: TextStyles.style
                    .copyWith(fontSize: 20, color: AppColors.textFeildColor),
                items: <String>[
                  'Select Category',
                  'Option 2',
                  'Option 3',
                  'Option 4'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            10.height,
            Container(
              height: 45,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff989595)),
                  borderRadius: BorderRadius.circular(17)),
              child: CustomTextFeild(
                controller: foodItemPrice,
                color: false,
                labelText: "Food Price",
              ),
            ),
            20.height,
            button(context, "Add Food Item", () {
              imageProvider.selectedImage = null;
            }, width: sw * 0.5)
          ],
        ),
      )),
    );
  }
}
