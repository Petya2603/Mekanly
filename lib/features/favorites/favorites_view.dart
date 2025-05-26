import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';
import '../../utils/extensions.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static const routePath = '/favorites-view';
  static const routeName = 'favorites-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    return const FavoritesView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FavoritesButton(),
          Column(
            children: [
              Assets.icons.icFavorite.svg(package: 'gen'),
              6.boxH,
              AppText.s14w400BdM(
                'Halanlarym bölüminde bildiriş ýok',
                fontFamily: StringConstants.roboto,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6A6A6A),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({super.key});

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelected = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                border: Border.all(
                  width: 1.sp,
                  color: isSelected
                      ? const Color(0xFFE5F6FE)
                      : const Color(0xFFEEEEEE),
                ),
                color: isSelected ? const Color(0xFFE5F6FE) : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6).h,
                child: AppText.s14w400BdM(
                  'Emläkler',
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color:
                      isSelected ? const Color(0xFF3A8BCF) : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isSelected = false;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                border: Border.all(
                  width: 1.sp,
                  color: !isSelected
                      ? const Color(0xFFE5F6FE)
                      : const Color(0xFFEEEEEE),
                ),
                color: !isSelected ? const Color(0xFFE5F6FE) : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6).h,
                child: AppText.s14w400BdM(
                  'Biznes hasaplar',
                  fontWeight: !isSelected ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color:
                  !isSelected ? const Color(0xFF3A8BCF) : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
