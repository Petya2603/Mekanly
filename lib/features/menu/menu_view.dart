import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';
import '../../utils/extensions.dart';
import 'widgets/profile_main_tile.dart';
import 'widgets/user_business_profile_tile.dart';
import 'widgets/user_profile_tile.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  static const routePath = '/menu-view';
  static const routeName = 'menu-view';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18).w,
        child: Column(
          children: [
            const UserProfileTile(),
            4.boxH,
            UserBusinessProfileTile(
              onTap: () {},
            ),
            ProfileMainTile(
              title: 'Jay goşmak',
              isAuthNeeded: true,
              icon: Assets.icons.icAddHouse.svg(package: 'gen'),
              onTap: () {},
              // onTap: () => context.push(ContentView.routePath),
            ),
            ProfileMainTile(
              title: 'Dil',
              isAuthNeeded: false,
              icon: Assets.icons.icLang.svg(package: 'gen'),
              onTap: () {
                chooseLang(context);
              },
            ),
            ProfileMainTile(
              isAuthNeeded: true,
              title: 'Teswirler',
              icon: Assets.icons.icChat.svg(package: 'gen'),
              onTap: () {
                // context.push(CommentsView.routePath);
              },
            ),
            ProfileMainTile(
              isAuthNeeded: false,
              title: 'Düzgünnama',
              icon: Assets.icons.icPrivacy.svg(package: 'gen'),
              onTap: () {},
            ),
            ProfileMainTile(
              isAuthNeeded: true,
              title: 'Habarlaşmak',
              icon: Assets.icons.icContactUs.svg(package: 'gen'),
              // onTap: () => context.push(ContactUsView.routePath),
              onTap: () {},
            ),
            ProfileMainTile(
              isAuthNeeded: false,
              title: 'Kömekçi',
              icon: Assets.icons.icHelp.svg(package: 'gen'),
              onTap: () {},
            ),
            ProfileMainTile(
              isLogOut: true,
              isAuthNeeded: true,
              title: 'Ulgamdan çykmak',
              icon: Assets.icons.icLogOut.svg(package: 'gen'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/// TODOS: Bayram ayyr beyle edilenok!!! -> ChooseLang.show() seyle, please
Future<void> chooseLang(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      var selectedLang = 'tm';
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            backgroundColor: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.96,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // Assets.icons.icLang.svg(package: 'gen'),
                      10.boxW,
                      AppText.s14w400BdM(
                        'Dil saýlaň',
                        fontSize: 18.sp,
                        fontFamily: StringConstants.roboto,
                        color: const Color(0xFF252525),
                      ),
                    ],
                  ),
                  RadioListTile(
                    autofocus: selectedLang == 'tm',
                    activeColor: Colors.lightBlue,
                    value: 'tm',
                    groupValue: selectedLang,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        selectedLang = value!;
                      });
                    },
                    title: AppText.s14w400BdM(
                      'Türkmen dili',
                      color: const Color(0xFF252525),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                  //SizedBox(height: 4),
                  RadioListTile(
                    autofocus: selectedLang == 'ru',
                    activeColor: Colors.lightBlue,
                    value: 'ru',
                    groupValue: selectedLang,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        selectedLang = value!;
                      });
                    },
                    title: AppText.s14w400BdM(
                      'Rus dili',
                      color: const Color(0xFF252525),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void notification(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.96,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFFFFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppText.s14w400BdM(
                  'Habarnama',
                  color: const Color(0xFF252525),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: StringConstants.roboto,
                ),
              ),
              10.boxH,
              AppText.s14w400BdM(
                'Siz ulgama girmänsiňiz! Bildirişi halanlaryma goşmak we halan bildirişleriňizi görüp bilmek üçin ulgama girmegiňiz gerek!',
                color: const Color(0xFF252525),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StringConstants.roboto,
                softWrap: true,
              ),
              8.boxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: AppText.s14w400BdM(
                      'Goý bolsun',
                      color: const Color(0xFF252525),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                  8.boxH,
                  TextButton(
                    onPressed: () {},
                    child: AppText.s14w400BdM(
                      'Ulgama girmek',
                      color: const Color(0xFF252525),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
