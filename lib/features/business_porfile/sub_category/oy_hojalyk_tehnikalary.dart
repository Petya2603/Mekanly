// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:gen/gen.dart';

// import '../../../core/components/app_text.dart';
// import '../../../core/components/search_field.dart';
// import '../../../product/constants/constants.dart';
// import '../../../utils/extensions.dart';
// import 'business_profile_grid_view.dart';

// class SubCategoryOyHojalyk extends StatelessWidget {
//   const SubCategoryOyHojalyk({super.key, required this.title});
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
//               crossAxisCount: 3,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: 8,
//               children: [
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Kir ýuwujy enjamlar',
//                     icon: Assets.icons.icWashingMachineGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Sowadyjylar we morazinikler',
//                     icon: Assets.icons.icFridgeGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Kondisionerler',
//                     icon: Assets.icons.icAirConditionerGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Tozan sorujylar',
//                     icon: Assets.icons.icVacuumCleanerGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Telewizorlar',
//                     icon: Assets.icons.icTvGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Tunerler we beýleki elektronika',
//                     icon: Assets.icons.icTunerOtherElectronicGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Gaz we tok plitalar',
//                     icon: Assets.icons.icGasToveGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Iýmit taýýarlaýjylar',
//                     icon: Assets.icons.icBlenderGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Ütükler',
//                     icon: Assets.icons.icIronGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Ýyladyjy enjamlar',
//                     icon: Assets.icons.icLubricatingEquipmentGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Gap-gaç ýuwujy enjamlar',
//                     icon: Assets.icons.icWashingMachineGridView.svg(package: 'gen'),
//                   ),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: SubcategoryTile(
//                     title: 'Beýleki enjamlar',
//                     icon: Assets.icons.icOtherEquipmentGridView.svg(package: 'gen'),
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
// //           padding: const EdgeInsets.only(top: 8),
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
