import 'package:common/common.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../core/components/app_btn.dart';
import '../../core/components/app_text.dart';
import '../../core/components/loading_indicator.dart';
import '../../core/components/try_again_widget.dart';
import '../../product/base/base_status/base_status.dart';
import '../../product/constants/constants.dart';
import '../../product/injection/injector.dart';
import '../../product/transitions/custom_page_route.dart';
import '../../remote/entities/house_detail/house_detail_response.dart';
import '../../utils/extensions.dart';
import '../../utils/helpers.dart';
import 'cubit/house_detail_cubit.dart';
import 'house_images.dart';
import 'widgets/circled_icon_btn.dart';
import 'widgets/gradient_bg_container.dart';
import 'widgets/row_main_info_tile.dart';

class HouseDetailRoute {
  HouseDetailRoute({
    required this.imgUrl,
    required this.id,
  });

  final List<String?>? imgUrl;
  final int? id;
}

class HouseDetailView extends StatelessWidget {
  const HouseDetailView({super.key, required this.data});

  static const routePath = '/house-detail-view';
  static const routeName = 'house-detail-view';

  static Widget builder(BuildContext context, HouseDetailRoute data) {
    final bloc = injector<HouseDetailCubit>();
    return BlocProvider(
      create: (context) => bloc
        ..getHouseDetail(
          data.id ?? 0,
        ),
      child: HouseDetailView(
        data: data,
      ),
    );
  }

  final HouseDetailRoute data;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext c, bool f) {
          return <Widget>[
            // ImageH
            SliverAppBar(
              pinned: true,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              expandedHeight: 320,
              backgroundColor: const Color(0xFF4D8BBF),
              automaticallyImplyLeading: false,
              leading: Row(
                children: [
                  14.boxW,
                  CircledIconBtn(
                    icon: Assets.icons.icBack.svg(package: 'gen'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              actions: [
                CircledIconBtn(
                  icon: Assets.icons.icShare.svg(package: 'gen'),
                  onTap: () {
                    //_showAnimatedBottomSheet(context);
                  },
                ),
                12.boxW,
                CircledIconBtn(
                  icon: Assets.icons.icHeartHouse.svg(package: 'gen'),
                  onTap: () {},
                ),
                14.boxW,
              ],
              //TODO: Bayram it is not good usecase as I see
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final currentHeight = constraints.biggest.height;
                  const double maxHeight = 320;
                  final minHeight =
                      kToolbarHeight + MediaQuery.of(context).padding.top;

                  var scrollPercentage = 1.0 -
                      ((currentHeight - minHeight) / (maxHeight - minHeight));
                  scrollPercentage = scrollPercentage.clamp(0.0, 1.0);
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Opacity(
                        opacity: 1.0 - scrollPercentage * 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     padding: const EdgeInsets.only(: 14, bottom: 16),
                      //     child: Opacity(
                      //       opacity: scrollPercentage,
                      //       child: const Text(
                      //         'Gyssagly satlyk jay',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Opacity(
                        opacity: 1.0 - scrollPercentage,
                        child: _HouseDetailImgSlider(data: data),
                      ),
                    ],
                  );
                },
              ),
            ),
          ];
        },
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        body: BlocBuilder<HouseDetailCubit, HouseDetailState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return LoadingIndicator.basic();
            }

            if (state.status.isFailure) {
              return TryAgainWidget(
                onTryAgain: () {
                  // context.read<HouseDetailCubit>().getHouseDetail(id);
                },
              );
            }
            final house = state.response?.data;
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderInfos(house: house),
                  const _Comments(),
                  12.boxH,
                  _HouseDetailInfo(
                    house: house,
                  ),
                  20.boxH,
                  _HouseDetailPossibility(
                    house: house,
                  ),
                  20.boxH,
                  _Description(description: house?.description),
                  20.boxH,
                  // if (bigBanners?.isNotEmpty ?? false)
                  //   AdvCard(
                  //     imgUrl:
                  //     'https://mekanly.com.tm/${bigBanners?.first.image ?? ''}',
                  //     logo: bigBanners?.first.logo != null &&
                  //         (bigBanners?.first.logo != 'storage/')
                  //         ? 'https://mekanly.com.tm/${bigBanners?.first.logo ?? ''}'
                  //         : null,
                  //   ),
                  20.boxH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12).w,
                    child: Row(
                      children: [
                        Assets.icons.icReport.svg(package: 'gen'),
                        8.boxW,
                        GestureDetector(
                          onTap: () {},
                          child: AppText.s14w400BdM(
                            'Nägilelik bildirmek',
                            fontFamily: StringConstants.roboto,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6A6A6A),
                            underline: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.boxH,

                  ///TODOS: Bayram will add this later
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12).w,
                  //   child: AppText.s14w400BdM(
                  //     'Başga bildirişler',
                  //     fontSize: 14.sp,
                  //     fontFamily: StringConstants.roboto,
                  //     fontWeight: FontWeight.w400,
                  //     color: const Color(0xFF000000),
                  //   ),
                  // ),
                  // 8.boxH,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12).w,
                  //   child: SizedBox(
                  //     width: MediaQuery.of(context).size.width - 12.w,
                  //     height:
                  //         ((MediaQuery.of(context).size.width * 0.35 * 198) /
                  //                 131) +
                  //             12.h,
                  //     child: ListView.separated(
                  //       padding: const EdgeInsets.only(
                  //         top: 6,
                  //         bottom: 6,
                  //         left: 6,
                  //       ),
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) =>
                  //           const NotificationCard(),
                  //       separatorBuilder: (context, index) => 7.boxW,
                  //       itemCount: 5,
                  //     ),
                  //   ),
                  // ),
                  10.boxH,
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8).w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff8f969e80).withValues(alpha: .5),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: AppBtn(
                onTap: () {},
                fontSize: 14.sp,
                textColor: const Color(0xFF009688),
                text: 'SMS UGRATMAK',
                fontWeight: FontWeight.w500,
                fontFamily: StringConstants.roboto,
                bgColor: const Color(0xffE9F7F0),
              ),
            ),
            9.boxW,
            Expanded(
              child: AppBtn(
                onTap: () {},
                text: 'JAŇ ETMEK',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: StringConstants.roboto,
                textColor: const Color(0xFF006169),
                bgColor: const Color(0xFFE5EFF0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({super.key, this.description});
  final String? description;

  @override
  Widget build(BuildContext context) {
    if (description == null) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10).w,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              color: const Color(0xffF6F6F6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText.s12w400BdS(
                    description!,
                    fontFamily: StringConstants.roboto,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HouseDetailInfo extends StatefulWidget {
  const _HouseDetailInfo({this.house});
  final HouseData? house;

  @override
  State<_HouseDetailInfo> createState() => _HouseDetailInfoState();
}

class _HouseDetailInfoState extends State<_HouseDetailInfo> {
  List<_HouseInfoGridItem> _items = [];

  @override
  void initState() {
    super.initState();

    _items = [
      _HouseInfoGridItem(
        icon: Assets.icons.icCategoryDetail.svg(package: 'gen'),
        title: 'Bölümi',
        value: widget.house?.categoryName,
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icCall.svg(package: 'gen'),
        title: 'Telefon nomeri',
        value: widget.house?.bronNumber.toString(),
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icCalendar.svg(package: 'gen'),
        title: 'Goýlan senesi',
        value: Helpers.formatDateAsMMDDYYYY(widget.house?.createdAt),
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icPerson.svg(package: 'gen'),
        title: 'Satyjy görnüşi',
        value: widget.house?.who.toString() ?? 'Eýesi',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icLux.svg(package: 'gen'),
        title: 'Emläk görnüşi',
        value: 'Elitga',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icFloorCount.svg(package: 'gen'),
        title: 'Otag sany',
        value: widget.house?.roomNumber.toString(),
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icLux.svg(package: 'gen'),
        title: 'Remont görnüşi',
        value: 'Ýewroremont',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icSquare.svg(package: 'gen'),
        title: 'Umumy meýdany',
        value: '${widget.house?.area} m²',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icStairsFloor.svg(package: 'gen'),
        title: 'Gat sany',
        value: widget.house?.floorNumber.toString(),
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icPrice.svg(package: 'gen'),
        title: 'Bahasy',
        value: '${widget.house?.price} TMT',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 25.w,
                width: 25.w,
                child: Assets.icons.icInfo.svg(package: 'gen'),
              ),
              5.boxW,
              AppText.s14w400BdM(
                'Maglumatlar',
                fontFamily: StringConstants.roboto,
                fontSize: 16.sp,
              ),
            ],
          ),
          12.boxH,
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              childAspectRatio: 130 / 64,
              // c
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return _items[index];
            },
          ),
        ],
      ),
    );
  }
}

class _HouseDetailPossibility extends StatefulWidget {
  const _HouseDetailPossibility({this.house});
  final HouseData? house;

  @override
  State<_HouseDetailPossibility> createState() =>
      _HouseDetailPossibilityState();
}

class _HouseDetailPossibilityState extends State<_HouseDetailPossibility> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.s14w400BdM(
            'Mümkinçilikler',
            fontFamily: StringConstants.roboto,
            fontSize: 16.sp,
          ),
          4.boxH,
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 100 / 20,
              // c
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.house?.possibilities?.length,
            itemBuilder: (context, index) {
              final possibility = widget.house?.possibilities?[index];
              return _HousePossibilityGridItem(possibility: possibility);
            },
          ),
        ],
      ),
    );
  }
}

class _HouseInfoGridItem extends StatelessWidget {
  const _HouseInfoGridItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  final Widget icon;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffDDDDDD),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(6.w),
      ),
      padding: const EdgeInsets.all(12).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 16.w,
                height: 16.w,
                child: icon,
              ),
              8.boxW,
              AppText.s12w400BdS(
                title,
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF222222),
                fontSize: 12.sp,
              ),
            ],
          ),
          16.boxH,
          AppText.s12w400BdS(
            value ?? '',
            fontFamily: StringConstants.roboto,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: const Color(0xFF374151),
          ),
        ],
      ),
    );
  }
}

class _HousePossibilityGridItem extends StatelessWidget {
  const _HousePossibilityGridItem({
    this.possibility,
  });

  final Possibility? possibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        possibility?.buildIcon ?? const SizedBox(),
        18.boxW,
        AppText.s14w400BdM(
          possibility?.title ?? '',
          fontFamily: StringConstants.roboto,
          color: const Color(0xff374151),
        ),
      ],
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).w,
      child: AppBtn(
        onTap: () {},
        fontSize: 12.sp,
        text: 'Teswirler  (0)',
        textColor: const Color(0xff555555),
        ltIcon: SizedBox(
          height: 18.w,
          child: Assets.icons.icComment.svg(
            package: 'gen',
            height: 18.w,
            colorFilter: const ColorFilter.mode(
              Color(0xff555555),
              BlendMode.srcIn,
            ),
          ),
        ),
        bgColor: const Color(0xffEEEEEE),
      ),
    );
  }
}

class _HeaderInfos extends StatelessWidget {
  const _HeaderInfos({
    required this.house,
  });

  final HouseData? house;

  @override
  Widget build(BuildContext context) {
    return GradientBgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppText.s14w400BdM(
                  house?.name ?? '',
                  fontFamily: StringConstants.roboto,
                  fontSize: 18.sp,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          16.boxH,
          RowMainInfoTile(
            data: house,
          ),
          16.boxH,
          Row(
            children: [
              SizedBox(
                width: 18.w,
                height: 18.w,
                child: Assets.icons.icLocationBlack.svg(package: 'gen'),
              ),
              6.boxW,
              AppText.s12w400BdS(
                '${house?.location?.parentName}\n${house?.location?.name}',
                softWrap: true,
                maxLines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HouseDetailImgSlider extends StatefulWidget {
  const _HouseDetailImgSlider({
    required this.data,
  });

  final HouseDetailRoute data;

  @override
  State<_HouseDetailImgSlider> createState() => _HouseDetailImgSliderState();
}

class _HouseDetailImgSliderState extends State<_HouseDetailImgSlider> {
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuery.size.width;
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (index) {
            _currentPage.value = index + 1;
          },
          itemCount: widget.data.imgUrl?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute.slide(
                    HouseImages(
                      houseImagesUrl: widget.data.imgUrl,
                    ),
                  ),
                );
              },
              child: CustomNetworkImage(
                imageUrl: widget.data.imgUrl?[index],
                memCache: CustomMemCache(
                  width: width.toInt().withDevicePixel(context),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: SizedBox(
            height: 20.w,
            child: Assets.icons.icLogoAppbar.image(package: 'gen'),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ).w,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: AppText.s10w400LbS(
                  '$value/${widget.data.imgUrl?.length}',
                  color: Colors.white,
                  fontFamily: StringConstants.roboto,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
