// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:gen/gen.dart';

// import '../../../core/components/app_text.dart';
// import '../../../product/constants/constants.dart';
// import 'gurlusyk.dart';
// import 'halylar.dart';
// import 'lýustralar_we_yşyklandyryjy.dart';
// import 'mebel_we_interier_grid_view.dart';
// import 'oy_hojalyk_tehnikalary.dart';
// import 'real_estate.dart';

// class SubCategory extends StatelessWidget {
//   const SubCategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       child: StaggeredGrid.count(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 8,
        
//         children: [
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Gozgalmaýan emläkler',
//               icon: Assets.icons..icRealEstateGridView.svg(package: 'gen'),
//             ),
//           ),
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Mebel',
//               icon: Assets.icons.icFurnitureGridView.svg(package: 'gen'),
//             ),
//           ),
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Öý hojalyk tehnikalary',
//               icon: Assets.icons.icHouseholdAppliancesGridView.svg(package: 'gen'),
//             ),
//           ),
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Haly we dokma',
//               icon: Assets.icons.icTekstilCarpetGridView.svg(package: 'gen'),
//             ),
//           ),
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Lýustralar we yşyklandyryjylar',
//               icon: Assets.icons.icChandelierGridView.svg(package: 'gen'),
//             ),
//           ),
//           StaggeredGridTile.count(
//             crossAxisCellCount: 1,
//             mainAxisCellCount: 1,
//             child: SubcategoryTile(
//               title: 'Gurluşyk',
//               icon: Assets.icons.icConstructionGridView.svg(package: 'gen'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SubcategoryTile extends StatelessWidget {
//   const SubcategoryTile({super.key, required this.title, required this.icon});
//   final String title;
//   final Widget icon;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         navigator(title, context);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFFF1F2EF),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8, left: 8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: AppText.s14w400BdM(
//                   title,
//                   color: const Color(0xFF535B5D),
//                   fontFamily: StringConstants.roboto,
//                   fontSize: 11.sp,
//                   fontWeight: FontWeight.w400,
//                   textAlign: TextAlign.start,
//                   softWrap: true,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: icon,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void navigator(String name, BuildContext context) {
//     switch (name) {
//       case 'Mebel':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubCategoryMebel(title: name),
//           ),
//         );
//       case 'Öý hojalyk tehnikalary':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubCategoryOyHojalyk(title: name),
//           ),
//         );
//       case 'Haly we dokma':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubCategoryHaly(title: name),
//           ),
//         );
//       case 'Lýustralar we yşyklandyryjylar':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubCategoryLyustra(title: name),
//           ),
//         );
//       case 'Gurluşyk':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubCategoryGurlusyk(title: name),
//           ),
//         );
//       case 'Gozgalmaýan emläkler':
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => RealEstate(title: name),
//           ),
//         );
//     }
//   }
// }
