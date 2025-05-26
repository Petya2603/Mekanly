import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';
import '../../utils/extensions.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  static const routePath = '/comments-view';
  static const routeName = 'comments-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    return const CommentsView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D8BBF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Assets.icons.icBackImage.svg(package: 'gen'),
        ),
        title: AppText.s14w400BdM(
          'Teswirler',
          fontWeight: FontWeight.w400,
          fontFamily: StringConstants.roboto,
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            const CommentsButton(),
            // Column(
            //   children: [
            //     Assets.icons.icFavorite.svg(package: 'gen'),
            //     6.boxH,
            //     AppText.s14w400BdM(
            //       'Halanlarym bölüminde bildiriş ýok',
            //       fontFamily: StringConstants.roboto,
            //       fontSize: 12.sp,
            //       fontWeight: FontWeight.w400,
            //       color: const Color(0xFF6A6A6A),
            //     ),
            //   ],
            // ),
            const MessageCard(),
            10.boxH,
            const MessageCard(),
            10.boxH,
            const AnswerCard(),
          ],
        ),
      ),
    );
  }
}

class CommentsButton extends StatefulWidget {
  const CommentsButton({super.key});

  @override
  State<CommentsButton> createState() => _CommentsButtonState();
}

class _CommentsButtonState extends State<CommentsButton> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
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
                  'Maňa ýazylanlar',
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color: isSelected
                      ? const Color(0xFF3A8BCF)
                      : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
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
                  'Meniň ýazanlarym',
                  fontWeight: !isSelected ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color: !isSelected
                      ? const Color(0xFF3A8BCF)
                      : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatefulWidget {
  const MessageCard({super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool isLike = false;
  bool isDislike = false;
  int dislikeNumber = 10;
  int likeNumber = 10;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: AspectRatio(
        aspectRatio: 341 / 95,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFDDDDDD),
                width: 0.7.sp,
              ),
            ),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8).w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    4.boxH,
                    AppText.s14w400BdM(
                      'BFI404HNR',
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      fontFamily: StringConstants.roboto,
                      color: Colors.black,
                    ),
                    AppText.s14w400BdM(
                      '13.10.2024, 20:21',
                      fontFamily: StringConstants.roboto,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp,
                      color: Colors.black,
                    ),
                    AppText.s14w400BdM(
                      'Reiltor haky näçe?',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: StringConstants.roboto,
                      color: Colors.black,
                    ),
                    //6.boxH,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              isDislike = false;
                            });
                          },
                          icon: !isLike
                              ? Assets.icons.icLike.svg(package: 'gen')
                              : Assets.icons.icSelectedLike.svg(package: 'gen'),
                        ),
                        AppText.s14w400BdM(
                          (isLike ? likeNumber + 1 : likeNumber).toString(),
                          fontFamily: StringConstants.roboto,
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp,
                          color: Colors.black,
                        ),
                        20.boxW,
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDislike = !isDislike;
                              isLike = false;
                            });
                          },
                          icon: !isDislike
                              ? Assets.icons.icDislike.svg(package: 'gen')
                              : Assets.icons.icSelectedDislike
                                  .svg(package: 'gen'),
                        ),
                        AppText.s14w400BdM(
                          (isDislike ? dislikeNumber + 1 : dislikeNumber)
                              .toString(),
                          fontFamily: StringConstants.roboto,
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    //4.boxH,
                  ],
                ),
              ),
              Positioned(
                top: 4,
                right: 2,
                child: PopupMenuButton(
                  elevation: 0.25,
                  icon: Assets.icons.icDotsVertical.svg(package: 'gen'),
                  //shadowColor: Colors.grey.withAlpha(4),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4).r,
                    side: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                      strokeAlign: 0.25,
                    ),
                  ),
                  itemBuilder: (context) => <PopupMenuItem<dynamic>>[
                    PopupMenuItem(
                      child: AppText.s14w400BdM(
                        'Pozmak',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: StringConstants.roboto,
                        color: Colors.black,
                      ),
                    ),
                    PopupMenuItem(
                      child: AppText.s14w400BdM(
                        'Üýtgetmek',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: StringConstants.roboto,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: AspectRatio(
          aspectRatio: 318 / 75,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.sp),
                topRight: Radius.circular(7.sp),
                bottomLeft: Radius.circular(7.sp),
              ),
              color: const Color(0xFFF6F6F6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  4.boxH,
                  AppText.s14w400BdM(
                    'Jogap beriji',
                    fontFamily: StringConstants.roboto,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: Colors.black,
                  ),
                  AppText.s14w400BdM(
                    '13.10.2024, 20:21',
                    fontFamily: StringConstants.roboto,
                    fontWeight: FontWeight.w400,
                    fontSize: 9.sp,
                    color: Colors.black,
                  ),
                  AppText.s14w400BdM(
                    '1000 manat',
                    fontFamily: StringConstants.roboto,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: Colors.black,
                  ),
                  6.boxH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
