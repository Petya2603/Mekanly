// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:gen/gen.dart';

// import '../../../core/components/app_text.dart';
// import '../../../core/components/search_field.dart';
// import '../../../product/constants/constants.dart';
// import '../../../utils/extensions.dart';
// import 'business_profile_grid_view.dart';

// class SubCategoryMebel extends StatelessWidget {
//   const SubCategoryMebel({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF4D8BBF),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Assets.icons.icBackImage.svg(package: 'gen'),
//         ),
//         title: AppText.s14w400BdM(
//           title,
//           fontWeight: FontWeight.w400,
//           fontSize: 16.sp,
//           fontFamily: StringConstants.roboto,
//           color: const Color(0xFFF8F8F8),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Assets.icons.icFavorite.svg(package: 'gen'),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: const Color(0xff5A8FBB),
//               boxShadow: [
//                 BoxShadow(
//                   color: ColorName.black.withValues(alpha: .25),
//                   blurRadius: 5,
//                   spreadRadius: 1,
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12).w,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SearchField(
//                     onTap: () {},
//                   ),
//                 ),
//                 10.boxW,
//                 GestureDetector(
//                   onTap: () {
//                     // if (filter?.data != null) {
//                     // context.push(
//                     // HouseFiltersView.routePath,
//                     // extra: HouseFilterRoute(
//                     // globalOptions: filter!.data,
//                     // bloc: context.read<HousesBloc>(),
//                     // ),
//                     // );
//                     // }
//                   },
//                   child: SizedBox(
//                     width: 35.w,
//                     height: 35.w,
//                     child: Assets.icons.icFilter.svg(package: 'gen'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           8.boxH,
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12,
//             ),
//             child: StaggeredGrid.count(
//               crossAxisCount: 6,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: 8,
//               children: [
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Krowat, diwan we kreslo',
//                     icon: Assets.icons.icBedGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Şkaf, sandyk we tekje',
//                     icon: Assets.icons.icShkafGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 2,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Stol',
//                     icon: Assets.icons.icStolGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 2,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Oturgyç',
//                     icon: Assets.icons.icStulGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 2,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Çaga mebelleri',
//                     icon: Assets.icons.icChildrenFurnitureGridView
//                         .svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Interier predmetleri',
//                     icon:
//                         Assets.icons.icInteriorPredmetsGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 3,
//                   child: SubcategoryTile(
//                     title: 'Aşhana mebel',
//                     icon: Assets.icons.icKitchenGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 2,
//                   child: SubcategoryTile(
//                     title: 'Perdeler we žalýuzlar',
//                     icon: Assets.icons.icPerdelerGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 2,
//                   child: SubcategoryTile(
//                     title: 'Beýleki mebeller',
//                     icon: Assets.icons.icOtherGridView.svg(package: 'gen'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class SubcategoryTile extends StatelessWidget {
// //   const SubcategoryTile({super.key, required this.title, required this.icon});
// //   final String title;
// //   final Widget icon;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () {},
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: const Color(0xFFF1F2EF),
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(8),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Align(
// //                 alignment: Alignment.topCenter,
// //                 child: AppText.s10w400LbS(
// //                   title,
// //                   color: ColorName.grayMediumDark,
// //                 ),
// //               ),
// //               Align(
// //                 alignment: Alignment.bottomRight,
// //                 child: icon,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
