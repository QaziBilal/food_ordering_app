// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:food_ordering_app/src/controller/CategoryController.dart';
// import 'package:food_ordering_app/src/controller/imageProvider.dart';
// import 'package:food_ordering_app/src/helper/constants.dart';
// import 'package:food_ordering_app/src/helper/dummy_data.dart';
// import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';
// import 'package:food_ordering_app/src/screens/NewScreens/showData.dart';
// import 'package:food_ordering_app/src/widgets/button.dart';
// import 'package:food_ordering_app/src/widgets/custom_appbar.dart';
// import 'package:food_ordering_app/src/widgets/custom_text.dart';
// import 'package:food_ordering_app/src/widgets/custom_textfield.dart';
// import 'package:provider/provider.dart';

// import '../../models/cateogry.dart';

// class AddCategoryScreen extends StatelessWidget {
//   AddCategoryScreen({super.key});
//   TextEditingController categoryName = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final imageProvider = Provider.of<ImageController>(context);
//     final categoryProvider =
//         Provider.of<CategoryController>(context, listen: false);
//     double sw = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size(sw, 100),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: CustomAppbar(
//               text: "Add Category",
//               check: false,
//             ),
//           )),
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 imageProvider.pickImage();
//               },
//               child: Container(
//                 width: sw * 0.5,
//                 height: sw * 0.5,
//                 padding:
//                     const EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.textFeildColor),
//                     borderRadius: BorderRadius.circular(30),
//                     color: AppColors.white),
//                 child: imageProvider.selectedImage != null
//                     ? Image.file(
//                         imageProvider.selectedImage!.absolute,
//                         height: sw * 0.3,
//                       )
//                     : Center(child: customText(context, "Select Image")),
//               ),
//             ),
//             10.height,
//             Container(
//               height: 45,
//               width: MediaQuery.sizeOf(context).width * 0.9,
//               decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xff989595)),
//                   borderRadius: BorderRadius.circular(17)),
//               child: CustomTextFeild(
//                 controller: categoryName,
//                 color: false,
//                 labelText: "CategoryName",
//               ),
//             ),
//             20.height,
//             button(context, "Add Category", () {
//               categoryProvider.addCategory(
//                   categoryName.text, imageProvider.selectedImage);
//               print("Category Saved");

//               categoryName.text = "";
//               imageProvider.selectedImage = null;
//             }, width: sw * 0.5),
//             // button(context, "Show Data", () {
//             //   Navigator.push(
//             //       context, MaterialPageRoute(builder: (context) => ShowData()));
//             // }, width: sw * 0.5)
//           ],
//         ),
//       )),
//     );
//   }
// }
