// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:food_ordering_app/src/controller/CategoryController.dart';
// import 'package:provider/provider.dart';

// import '../../helper/constants.dart';
// import '../../models/cateogry.dart';
// import '../../widgets/custom_appbar.dart';
// import '../../widgets/custom_text.dart';
// import '../food_item_screen.dart';

// class ShowData extends StatelessWidget {
//   const ShowData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double sw = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: sw * 0.3,
//             child: Consumer<CategoryController>(
//               builder: (context, categoryProvider, _) {
//                 List<CategoryModel1> categoriesListfromProvider =
//                     categoryProvider.categoryList1;

//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categoriesListfromProvider.length,
//                   itemBuilder: (context, index) {
//                     CategoryModel1 category = categoriesListfromProvider[index];

//                     return Padding(
//                       padding: const EdgeInsets.only(right: 10, left: 10),
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) => FoodItemsScreen(
//                               //       categoryModel: category,
//                               //       newindex: index,
//                               //     ),
//                               //   ),
//                               // );
//                             },
//                             child: Container(
//     // width: sw * 0.15,
//     // height: sw * 0.15,
//     decoration: BoxDecoration(
//         gradient:  LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                     AppColors.firstColor.withOpacity(0.43),
//                     AppColors.secondColor.withOpacity(0.0)
//                   ])
//            ,
//         borderRadius: BorderRadius.circular(15)),
//     padding: const EdgeInsets.all(15),
//     child: kIsWeb
//         ? Image.network("assets/$image",
//             width: sw * 0.1, height: sw * 0.1, fit: BoxFit.fill)
//         : Image.memory(Unit8List.fromList(category.categoryImage!),
//             width: sw * 0.1, height: sw * 0.1, fit: BoxFit.fill),
//   );,
//                           ),
//                           SizedBox(height: 10),
//                           customText(
//                             context,
//                             category.categoryName,
//                             color: AppColors.textFeildColor,
//                             size: 14,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
