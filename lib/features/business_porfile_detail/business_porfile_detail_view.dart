import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../core/components/app_text.dart';
import '../../core/components/loading_indicator.dart';
import '../../core/components/try_again_widget.dart';
import '../../product/base/base_status/base_status.dart';
import '../../product/constants/constants.dart';
import '../../product/injection/injector.dart';
import '../../remote/entities/houses/house_entity.dart';
import '../../utils/extensions.dart';
import '../house_detail/house_detail_view.dart';
import 'bloc/business_profile_detail_bloc.dart';
import 'widgets/business_detail_app_bar.dart';

class BusinessProfileDetailView extends StatefulWidget {
  const BusinessProfileDetailView({super.key, required this.id});

  static const routePath = '/business-profile-detail-view';
  static const routeName = 'business-profile-detail-view';

  final int? id;

  static Widget builder(BuildContext context, GoRouterState state) {
    final bloc = injector<BusinessProfileDetailBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BusinessProfileDetailView(
        id: state.extra as int?,
      ),
    );
  }

  @override
  State<BusinessProfileDetailView> createState() =>
      _BusinessProfileDetailViewState();
}

class _BusinessProfileDetailViewState extends State<BusinessProfileDetailView> {
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      context
          .read<BusinessProfileDetailBloc>()
          .add(BusinessProfileDetailEvent.init(widget.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BusinessProfileDetailBloc, BusinessProfileDetailState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return LoadingIndicator.circle();
          }

          if (state.status.isFailure) {
            return TryAgainWidget(
              onTryAgain: () async {},
            );
          }
          final detail =
              (state.response?.data != null) ? state.response?.data : null;
          return DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CollapsibleImageHeader(
                      bgUrl: detail?.image,
                      logoUrl: detail?.logo,
                      viewCount: detail?.views,
                      time: DateTime.now(),
                      subTitle: detail?.description,
                      title: detail?.brand,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: 2.boxH,
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    primary: false,
                    title: TabBar(
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      labelStyle:
                          context.textTheme.bodyMedium?.copyWith(fontSize: 12),
                      indicatorColor: const Color(0xff474747),
                      tabs: [
                        Tab(
                          height: 45,
                          text: 'Bildirişler',
                          icon: Assets.icons.icCalendar.svg(package: 'gen'),
                        ),
                        Tab(
                          height: 45,
                          text: 'Satyjy profili',
                          icon: Assets.icons.icCalendar.svg(package: 'gen'),
                        ),
                      ],
                    ),
                    backgroundColor: const Color(0xffE9E9E9),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.all(6),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  childAspectRatio:
                      ((context.mediaQuery.size.width - 24.w) * 0.5) / 235,
                  children: List.generate(2, (index) {
                    // final house = houses?[index];
                    return const MainBusinessProfileItem(
                        // house: house,
                        );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MainBusinessProfileItem extends StatefulWidget {
  const MainBusinessProfileItem({super.key, this.house});
  final HouseEntity? house;

  @override
  State<MainBusinessProfileItem> createState() =>
      _MainBusinessProfileItemState();
}

class _MainBusinessProfileItemState extends State<MainBusinessProfileItem> {
  bool isLux = true;
  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuery.size.width;
    //const aspect = 167 / 225;
    print('width : $width');
    return InkWell(
      onTap: () {
        // BaseLogger.log(' ID --> ${widget.house?.id}');
        if (widget.house?.id == null) {
          return;
        }
        final imgs = widget.house?.images?.map((e) => e.url).toList();
        final data = HouseDetailRoute(imgUrl: imgs, id: widget.house!.id);
        context.push(HouseDetailView.routePath, extra: data);
      },
      borderRadius: BorderRadius.circular(11).r,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorName.notifyShadow,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(11).r,
          gradient: isLux
              ? const LinearGradient(
                  colors: [
                    Color(0xFFfde89b),
                    Color(0xFFffffff),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 70,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(11).r,
                      topRight: const Radius.circular(11).r,
                    ),
                    child: BusinessProfileCarouselSlider(
                      imgUrls: widget.house?.images,
                    ),
                  ),
                  if (isLux)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: Image.asset(
                          'assets/vip.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    Container(),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child:
                          Assets.icons.icFavoriteDarkFill.svg(package: 'gen'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.s16w400BdL(
                    'Kwartira',
                    //widget.house?.name ?? '',
                    fontFamily: StringConstants.roboto,
                  ),
                  //4.boxH,
                  AppText.s14w400BdM(
                    'Gyssagly satlyk jay',
                    //widget.house?.description ?? '',
                    fontFamily: StringConstants.roboto,
                    fontSize: 12.sp,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: ColorName.addressDate,
                  ),
                  //4.boxH,
                  AppText.s14w400BdM(
                    '400000 TMT',
                    //'${widget.house?.price ?? ''} TMT',
                    fontSize: 15.sp,
                    fontFamily: StringConstants.roboto,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    4.boxH,
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppText.s14w400BdM(
                        'Kwartira',
                        //widget.house?.name ?? '',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xFF222222),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //4.boxH,
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppText.s14w400BdM(
                        'Gyssagly satlyk jay',
                        //widget.house?.description ?? '',
                        fontFamily: StringConstants.roboto,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        softWrap: true,
                        color: const Color(0xFF757575),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //4.boxH,
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppText.s14w400BdM(
                        '400000 TMT',
                        //'${widget.house?.price ?? ''} TMT',
                        fontSize: 12.sp,
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF222222),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    4.boxH,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessProfileCarouselSlider extends StatefulWidget {
  const BusinessProfileCarouselSlider({super.key, this.imgUrls});
  final List<ImageUrl>? imgUrls;

  @override
  State<BusinessProfileCarouselSlider> createState() =>
      _BusinessProfileCarouselSliderState();
}

class _BusinessProfileCarouselSliderState
    extends State<BusinessProfileCarouselSlider> {
  final PageController _controller = PageController(keepPage: false);
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 24.w) * 0.5;
    final height = context.mediaQuery.size.height;
    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.imgUrls?.length, //widget.imgUrls?.length,
          controller: _controller,
          onPageChanged: (value) => _pageNotifier.value = value,
          itemBuilder: (context, index) {
            final img = widget.imgUrls?[index];
            return OverflowBox(
              child: CustomNetworkImage(
                memCache: CustomMemCache(
                  height: height.toInt().withDevicePixel(context),
                  width: width.toInt().withDevicePixel(context),
                ),
                imageUrl: img?.url,
              ),
            );
          },
        ),
        if (widget.imgUrls!.length > 2)
          Positioned(
            bottom: 6,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              height: 10.h,
              alignment: Alignment.center,
              child: ValueListenableBuilder<int>(
                valueListenable: _pageNotifier,
                builder: (_, page, __) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imgUrls!.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: index == (page % widget.imgUrls!.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        height: index == (page % widget.imgUrls!.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 3).w,
                        decoration: BoxDecoration(
                          color: index == (page % widget.imgUrls!.length)
                              ? Colors.white
                              : Colors.white60,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
