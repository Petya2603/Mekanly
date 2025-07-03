import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/components/app_btn.dart';
import '../../core/components/app_text.dart';
import '../../core/components/loading_indicator.dart';
import '../../core/components/try_again_widget.dart';
import '../../localization/extensions.dart';
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
import 'widgets/pop_up.dart';
import 'widgets/row_main_info_tile.dart';

class HouseDetailRoute {
  HouseDetailRoute({
    required this.imgUrl,
    required this.id,
  });

  final List<String?>? imgUrl;
  final int? id;
}

class HouseDetailView extends StatefulWidget {
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
  State<HouseDetailView> createState() => _HouseDetailViewState();
}

class _HouseDetailViewState extends State<HouseDetailView> {
  double _scrollPercentage = 0.0;
  bool shareLink = false;
  bool shareImage = true;

  late String link;
  late List<String> imageUrls;

  @override
  void initState() {
    super.initState();

    final rawImageUrl = widget.data.imgUrl?.toString() ?? '';

    if (rawImageUrl.startsWith('[') && rawImageUrl.endsWith(']')) {
      final cleanStr = rawImageUrl.substring(1, rawImageUrl.length - 1);
      imageUrls = cleanStr.split(',').map((e) => e.trim()).toList();
    } else if (rawImageUrl.isNotEmpty) {
      imageUrls = [rawImageUrl];
    } else {
      imageUrls = [];
    }

    while (imageUrls.length < 3) {
      imageUrls.add('');
    }

    link = 'https://mekanly.com/house/${widget.data.imgUrl}';
  }

  Future<void> shareImagesWithDio(List<String> imageUrls,
      {String? text}) async {
    try {
      final tempDir = await getTemporaryDirectory();
      var files = <XFile>[];

      for (int i = 0; i < imageUrls.length; i++) {
        final imageUrl = imageUrls[i];
        if (imageUrl.isEmpty) continue;

        final filePath = '${tempDir.path}/shared_image_$i.jpg';

        final dio = Dio();
        await dio.download(imageUrl, filePath);

        files.add(XFile(filePath));
      }

      if (files.isNotEmpty) {
        await Share.shareXFiles(files, text: text);
      } else if (text != null) {
        await Share.share(text);
      } else {
        print('surat yok.');
      }
    } catch (e) {
      print('Error sharing images: $e');
    }
  }

  void _showShareBottomSheet(BuildContext context, List<String> imageUrls) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(255, 245, 240, 234),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final isRTL = Directionality.of(context) == TextDirection.rtl;

            const double stackWidth = 180;
            const double imageSize = 140;
            const baseOffset = (stackWidth - imageSize) / 2;

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Assets.icons.close.svg(package: 'gen'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: stackWidth,
                      height: stackWidth,
                      child: Stack(
                        children: List.generate(
                          imageUrls.length.clamp(0, 3),
                          (index) {
                            final verticalOffset = index * 12.0;
                            final scale = 1.0 - (index * 0.04);
                            const offsetAmount = 12.0;
                            double horizontalOffset;
                            switch (index) {
                              case 0:
                                horizontalOffset = offsetAmount;
                                break;
                              case 1:
                                horizontalOffset = 0;
                                break;
                              case 2:
                                horizontalOffset = -offsetAmount;
                                break;
                              default:
                                horizontalOffset = index * 12.0;
                            }

                            return TweenAnimationBuilder<double>(
                              duration:
                                  Duration(milliseconds: 400 + (index * 100)),
                              curve: Curves.easeOutBack,
                              tween: Tween<double>(begin: 0.0, end: 1),
                              builder: (context, value, child) {
                                return Positioned(
                                  left: isRTL
                                      ? null
                                      : baseOffset + horizontalOffset,
                                  right: isRTL
                                      ? baseOffset + horizontalOffset
                                      : null,
                                  top: verticalOffset,
                                  child: Transform.scale(
                                    scale: (scale * value).clamp(0.0, 1.0),
                                    child: Opacity(
                                      opacity: value.clamp(0.0, 1.0),
                                      child: Container(
                                        width: imageSize,
                                        height: imageSize,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          border: Border.all(
                                              color: Colors.white, width: 6),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: imageUrls[index].isNotEmpty
                                            ? Image.network(
                                                imageUrls[index],
                                                fit: BoxFit.contain,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.translation.share_with_friends,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 34, 34, 34),
                      fontFamily: StringConstants.roboto,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Checkbox(
                        value: shareLink,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            shareLink = value!;
                            if (value) shareImage = false;
                          });
                        },
                      ),
                      Text(
                        context.translation.share_link,
                        style: const TextStyle(
                          fontFamily: StringConstants.roboto,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 34, 34, 34),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: shareImage,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            shareImage = value!;
                            if (value) shareLink = false;
                          });
                        },
                      ),
                      Text(
                        context.translation.share_photo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: StringConstants.roboto,
                          color: Color.fromARGB(255, 34, 34, 34),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);

                        if (shareLink) {
                          final urlText =
                              imageUrls.where((e) => e.isNotEmpty).join('\n');
                          await Share.share(urlText);
                        }
                        if (shareImage) {
                          await shareImagesWithDio(imageUrls);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.share, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            context.translation.share,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringConstants.roboto,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showReportBottomSheet(BuildContext context) {
    String? selectedReason;

    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText.s14w400BdM(
                        '',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  ...[
                    'Satylan',
                    'Bildirş hakyk däl',
                    'Habarlaşyp bolanok',
                    'Suraty ýok',
                    'Hakyký eýesi däl',
                    'Başga sebäp'
                  ].map((reason) {
                    return RadioListTile<String>(
                      title: Text(reason),
                      value: reason,
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedReason == null
                          ? null
                          : () {
                              Navigator.pop(context);
                              _showConfirmationDialog(context);
                            },
                      child: Text(context.translation.send), // Mesela: "Ugrat"
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(context.translation.notification), // Mesela: "Habarname"
          content: Text(
            'Kabul edildi, biz bu bildirşi gözden geçireris.',
          ), // "Kabul edildi, biz bu bildirşi gözden geçireris."
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(context.translation.ok), // "OK"
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext c, bool f) {
          final currentHeight = context.findRenderObject() is RenderBox
              ? (context.findRenderObject()! as RenderBox).size.height
              : kToolbarHeight;
          const maxHeight = 320;
          final minHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
          var scrollPercentage =
              1.0 - ((currentHeight - minHeight) / (maxHeight - minHeight));
          scrollPercentage = scrollPercentage.clamp(0.0, 1.0);
          return <Widget>[
            // ImageH
            SliverAppBar(
              pinned: true,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              expandedHeight: 320,
              backgroundColor: const Color(0xFF4D8BBF),
              automaticallyImplyLeading: false,
              leading: _scrollPercentage < 0.8
                  ? Row(children: [
                      14.boxW,
                      CircledIconBtn(
                        icon: Assets.icons.icBack.svg(
                          package: 'gen',
                          width: 18,
                          height: 18,
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ])
                  : null,

              actions: [
                if (_scrollPercentage < 0.8)
                  Row(children: [
                    CircledIconBtn(
                      icon: Assets.icons.icShare.svg(package: 'gen'),
                      onTap: () {
                        final rawImageUrl =
                            widget.data.imgUrl?.toString() ?? '';

                        List<String> imageUrls;

                        if (rawImageUrl.startsWith('[') &&
                            rawImageUrl.endsWith(']')) {
                          final cleanStr =
                              rawImageUrl.substring(1, rawImageUrl.length - 1);
                          imageUrls =
                              cleanStr.split(',').map((e) => e.trim()).toList();
                        } else if (rawImageUrl.isNotEmpty) {
                          imageUrls = [rawImageUrl];
                        } else {
                          imageUrls = [];
                        }
                        while (imageUrls.length < 3) {
                          imageUrls.add('');
                        }

                        _showShareBottomSheet(context, imageUrls);
                      },
                    ),
                    12.boxW,
                    CircledIconBtn(
                      icon: Assets.icons.icHeartHouse.svg(package: 'gen'),
                      onTap: () {},
                    ),
                    14.boxW,
                  ])
                else
                  Row(
                    children: [
                      IconButton(
                        icon: Assets.icons.icShare.svg(
                          package: 'gen',
                          color: Colors.white,
                          width: 25,
                          height: 25,
                        ),
                        onPressed: () {
                          final rawImageUrl =
                              widget.data.imgUrl?.toString() ?? '';
                          List<String> imageUrls;
                          if (rawImageUrl.startsWith('[') &&
                              rawImageUrl.endsWith(']')) {
                            final cleanStr = rawImageUrl.substring(
                              1,
                              rawImageUrl.length - 1,
                            );
                            imageUrls = cleanStr
                                .split(',')
                                .map((e) => e.trim())
                                .toList();
                          } else if (rawImageUrl.isNotEmpty) {
                            imageUrls = [rawImageUrl];
                          } else {
                            imageUrls = [];
                          }
                          while (imageUrls.length < 5) {
                            imageUrls.add('');
                          }

                          _showShareBottomSheet(context, imageUrls);
                        },
                      ),
                      12.boxW,
                      IconButton(
                        icon: Assets.icons.icHeartHouse.svg(
                          color: Colors.white,
                          package: 'gen',
                          width: 25,
                          height: 25,
                        ),
                        onPressed: () {},
                      ),
                      14.boxW,
                    ],
                  ),
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

                  if (scrollPercentage != _scrollPercentage) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _scrollPercentage = scrollPercentage;
                        });
                      }
                    });
                  }
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
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Opacity(
                            opacity: scrollPercentage,
                            child: Row(children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 5.w),
                              const Text(
                                'Gyssagly satlyk jay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 1.0 - scrollPercentage,
                        child: _HouseDetailImgSlider(data: widget.data),
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
                  context
                      .read<HouseDetailCubit>()
                      .getHouseDetail(widget.data.id ?? 0);
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
                  12.boxH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12).w,
                    child: const ClickableBanner(),
                  ),
                  12.boxH,
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
                  //         'https://mekanly.com.tm/${bigBanners?.first.image ?? ''}',
                  //     logo: bigBanners?.first.logo != null &&
                  //             (bigBanners?.first.logo != 'storage/')
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
                          onTap: () {
                            _showReportBottomSheet(context);
                          },
                          child: AppText.s14w400BdM(
                            context.translation.report,
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

                  // ///TODOS: Bayram will add this later
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
      bottomNavigationBar: BlocBuilder<HouseDetailCubit, HouseDetailState>(
        builder: (context, state) {
          final house = state.response?.data;
          return Container(
            padding: const EdgeInsets.all(8).w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff8f969e80).withOpacity(.5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppBtn(
                    onTap: () async {
                      final number = house?.bronNumber?.toString();
                      if (number != null && number.isNotEmpty) {
                        final smsUri = Uri.parse('sms:$number');
                        try {
                          await launchUrl(smsUri,
                              mode: LaunchMode.externalApplication);
                        } catch (e) {
                          print('SMS ugradylmady: $e');
                        }
                      } else {
                        print('Nomeri tapylmady.');
                      }
                    },
                    fontSize: 12.sp,
                    textColor: const Color(0xFF009688),
                    text: context.translation.send_sms,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringConstants.roboto,
                    bgColor: const Color(0xffE9F7F0),
                    ltIcon: SizedBox(
                      height: 18.w,
                      child: Assets.icons.sms.svg(
                        package: 'gen',
                      ),
                    ),
                  ),
                ),
                9.boxW,
                Expanded(
                  flex: 2,
                  child: AppBtn(
                    onTap: () async {
                      final number = house?.bronNumber?.toString();
                      if (number != null && number.isNotEmpty) {
                        final telUri = Uri.parse('tel:$number');
                        try {
                          await launchUrl(telUri,
                              mode: LaunchMode.externalApplication);
                        } catch (e) {
                          print('Jaň edip bolmady: $e');
                        }
                      } else {
                        print('Nomeri tapylmady.');
                      }
                    },
                    text: context.translation.call,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringConstants.roboto,
                    textColor: const Color(0xFF006169),
                    bgColor: const Color(0xFFE5EFF0),
                    ltIcon: SizedBox(
                      height: 18.w,
                      child: Assets.icons.icCalll.svg(
                        package: 'gen',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({this.description});
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
    // Burada context ile işlem yapma
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Burada context'i güvenle kullanabilirsin
    _items = [
      _HouseInfoGridItem(
        icon: Assets.icons.icCategoryDetail.svg(package: 'gen'),
        title: context.translation.section,
        value: widget.house?.categoryName ?? '',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icCall.svg(package: 'gen'),
        title: context.translation.phone_number,
        value: widget.house?.bronNumber?.toString() ?? '',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icCalendar.svg(package: 'gen'),
        title: 'Goýlan senesi',
        value: Helpers.formatDateAsMMDDYYYY(widget.house?.createdAt),
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icPerson.svg(package: 'gen'),
        title: context.translation.salesman_type,
        value: widget.house?.who?.toString() ?? 'Eýesi',
      ),
      _HouseInfoGridItem(
        icon: SizedBox(
          width: 24.w,
          height: 24.w,
          child: Assets.icons.luxx.svg(package: 'gen'),
        ),
        title: context.translation.house_type,
        value: 'Elitga',
      ),
      _HouseInfoGridItem(
        icon: SizedBox(
          width: 24.w,
          height: 24.w,
          child: Assets.icons.icFloorCount.svg(package: 'gen'),
        ),
        title: context.translation.room_number,
        value: widget.house?.roomNumber?.toString() ?? '',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.isremont.svg(package: 'gen'),
        title: context.translation.remont_gorn,
        value: 'Ýewroremont',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icSquare.svg(package: 'gen'),
        title: context.translation.total_area,
        value: widget.house?.area != null ? '${widget.house?.area} m²' : '',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icStairsFloor.svg(package: 'gen'),
        title: context.translation.floor_number,
        value: widget.house?.floorNumber?.toString() ?? '',
      ),
      _HouseInfoGridItem(
        icon: Assets.icons.icPrice.svg(package: 'gen'),
        title: context.translation.price,
        value: widget.house?.price != null ? '${widget.house?.price} TMT' : '',
        isBold: true,
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
              AppText.s14w400BdM(
                context.translation.informations,
                fontFamily: StringConstants.roboto,
                fontSize: 16.sp,
              ),
              5.boxW,
              SizedBox(
                height: 25.w,
                width: 25.w,
                child: Assets.icons.icInfo.svg(package: 'gen'),
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
            context.translation.mumkincilikler,
            fontFamily: StringConstants.roboto,
            fontSize: 18.sp,
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
    this.isBold = false,
  });

  final Widget icon;
  final String title;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffDDDDDD),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(6.w),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEEEEEE),
            blurRadius: 4.w,
            spreadRadius: 1.w,
            offset: Offset(0, 2.w),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 18.w,
                height: 18.w,
                child: icon,
              ),
              8.boxW,
              AppText.s12w400BdS(
                title,
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF222222),
                fontSize: 13.sp,
              ),
            ],
          ),
          16.boxH,
          AppText.s12w400BdS(
            value,
            fontFamily: StringConstants.roboto,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            fontSize: 13.sp,
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
        fontSize: 13.sp,
        text: '${context.translation.comments}  (0)',
        textColor: const Color(0xff555555),
        ltIcon: SizedBox(
          height: 18.w,
          child: Assets.icons.icComment.svg(
            package: 'gen',
            height: 22.w,
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
