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
import '../../remote/entities/user_house/user_houses_response.dart';
import '../../remote/entities/user_profile/user_profile_info_response.dart';
import '../../utils/extensions.dart';
import '../add_house/add_house_view.dart';
import 'bloc/content_bloc.dart';



/// TODOS: can not find enough time to separate components

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  static const routePath = '/content-view';
  static const routeName = 'content-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    final bloc = injector<ContentBloc>();
    return BlocProvider(
      create: (context) => bloc..add(const ContentEvent.init()),
      child: const ContentView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D8BBF),
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          icon: Assets.icons.icBackImage.svg(package: 'gen'),
        ),
        title: AppText.s14w400BdM(
          'Bildirişlerim',
          fontSize: 14.sp,
          color: Colors.white,
          fontFamily: StringConstants.roboto,
        ),
        centerTitle: true,
      ),
      floatingActionButton: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          final options = state.globalOptions;
          if (options == null) {
            return const SizedBox();
          }
          return FloatingActionButton(
            backgroundColor: const Color(0xFF0A7CCA),
            foregroundColor: const Color(0xFF0A7CCA),
            elevation: 0,
            shape: const CircleBorder(),
            onPressed: () async {
              final isAdded = await context.push<bool?>(
                AddHouseView.routePath,
                extra: options,
              );

              if ((isAdded ?? false) && context.mounted) {
                {
                  context.read<ContentBloc>().add(const ContentEvent.init());
                }
              }
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
        },
      ),
      body: BlocConsumer<ContentBloc, ContentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status.isLoading) {
            return LoadingIndicator.circle();
          }

          if (state.status.isFailure) {
            return TryAgainWidget(
              onTryAgain: () {
                context.read<ContentBloc>().add(const ContentEvent.init());
              },
            );
          }
          final categories = state.productCategories;
          final houses = state.userHouses;
          if (houses == null || houses.isEmpty) {
            return Center(
              child: AppText.s14w400BdM(
                'Häzirki wagtda hiç hili maglumat ýok',
                fontSize: 14,
                color: const Color(0xFF555555),
              ),
            );
          }

          return Column(
            children: [
              8.boxH,
              Container(
                constraints: BoxConstraints(
                  maxHeight: 30.h,
                ),
                child: ContentButtons(
                  categories: categories,
                ),
              ),
              10.boxH,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: GridView.builder(
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 24).w,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 167 / 223,
                      crossAxisCount: 2,
                    ),
                    itemCount: houses.length,
                    itemBuilder: (context, index) {
                      final house = houses[index];
                      return ContentHouseCard(
                        house: house,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


/// TODOS: can not find enough time to separate components


class ContentButtons extends StatefulWidget {
  const ContentButtons({super.key, this.categories});

  final List<UserProductCategory>? categories;

  @override
  State<ContentButtons> createState() => _ContentButtonsState();
}

class _ContentButtonsState extends State<ContentButtons> {
  @override
  Widget build(BuildContext context) {
    final categories = widget.categories ?? [];
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8).w,
      separatorBuilder: (context, index) => 8.boxW,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) =>
          RoundedBlueBorderedButton(
        text: categories[index].title ?? '',
      ),
    );
  }
}

class RoundedBlueBorderedButton extends StatefulWidget {
  const RoundedBlueBorderedButton({super.key, required this.text});
  final String text;

  @override
  State<RoundedBlueBorderedButton> createState() =>
      _RoundedBlueBorderedButtonState();
}

class _RoundedBlueBorderedButtonState extends State<RoundedBlueBorderedButton> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color:
              _isSelected ? const Color(0xFF3A8BCF) : const Color(0xFFF3F5F6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 8,
          ).w,
          child: AppText.s14w400BdM(
            widget.text,
            fontFamily: StringConstants.roboto,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: _isSelected ? Colors.white : const Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}

class ContentHouseCard extends StatefulWidget {
  const ContentHouseCard({super.key, this.house});
  final UserHouse? house;

  @override
  State<ContentHouseCard> createState() => _ContentHouseCardState();
}

class _ContentHouseCardState extends State<ContentHouseCard> {
  @override
  Widget build(BuildContext context) {
    final house = widget.house;
    final images = house?.images?.map((image) => image.url).toList() ?? [];
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.2,
              color: const Color(0xFF000000).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 69,
              child: Stack(
                children: [
                  ContentHouseImageCarousel(
                    imgUrls: images,
                  ),
                  _houseStatus(house),
                ],
              ),
            ),
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(8).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText.s14w400BdM(
                        house?.name ?? '',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: const Color(0xFF222222),
                      ),
                    ),
                    2.boxH,
                    Expanded(
                      child: AppText.s14w400BdM(
                        '${house?.description} ${house?.description} ${house?.description}',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 11.sp,
                        color: const Color(0xFF757575),
                      ),
                    ),
                    2.boxH,
                    Expanded(
                      child: AppText.s14w400BdM(
                        '${house?.price ?? ''} TMT',
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _houseStatus(UserHouse? house) {
    return Positioned(
      top: 8,
      left: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40).r,
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 1.sp,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF1F1F1),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFF1F1F1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Row(
            children: [
              Container(
                width: 6.sp,
                height: 6.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: house?.statusColor,
                ),
              ),
              4.boxW,
              AppText.s14w400BdM(
                house?.statusText ?? '',
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StringConstants.roboto,
                color: const Color(0xFF222222),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentHouseImageCarousel extends StatefulWidget {
  const ContentHouseImageCarousel({super.key, required this.imgUrls});
  final List<String?>? imgUrls;

  @override
  State<ContentHouseImageCarousel> createState() =>
      _ContentHouseImageCarouselState();
}

class _ContentHouseImageCarouselState extends State<ContentHouseImageCarousel> {
  final PageController _controller = PageController(keepPage: false);
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final images = widget.imgUrls ?? [];
    if (images.isEmpty) {
      return AspectRatio(
        aspectRatio: 167 / 155,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8).r,
            topRight: const Radius.circular(8).r,
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(8).r,
                topRight: const Radius.circular(8).r,
              ),
              color: const Color(0xffEDEBE9),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 56,
              child: Assets.icons.icEmptyHouseDetail.svg(
                package: 'gen',
                colorFilter:
                    const ColorFilter.mode(Color(0xffC6C6C8), BlendMode.srcIn),
              ),
            ),
          ),
        ),
      );
    }
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 167 / 155,
          child: PageView.builder(
            padEnds: false,
            itemCount: images.length, //widget.imgUrls?.length,
            controller: _controller,
            onPageChanged: (value) => _pageNotifier.value = value,
            itemBuilder: (context, index) {
              final img = images[index];
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8).r,
                  topRight: const Radius.circular(8).r,
                ),
                child: CustomNetworkImage(
                  imageUrl: img,
                  memCache: CustomMemCache(
                    height: 155.withDevicePixel(context),
                    width: 167.withDevicePixel(context),
                  ),
                ),
              );
            },
          ),
        ),
        if (images.length > 2)
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
                      images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: index == (page % images.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        height: index == (page % images.length)
                            ? 10.h * 0.5
                            : 10.h * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 3).w,
                        decoration: BoxDecoration(
                          color: index == (page % images.length)
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