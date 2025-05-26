import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../core/components/loading_indicator.dart';
import '../../core/components/search_field.dart';
import '../../core/components/try_again_widget.dart';
import '../../product/base/base_status/base_status.dart';
import '../../utils/extensions.dart';
import '../house_filters/house_filters_view.dart';
import 'bloc/houses_bloc.dart';
import 'widgets/main_house_item.dart';
import 'widgets/rounded_blue_bordered_chip_btn.dart';

class HousesView extends StatefulWidget {
  const HousesView({super.key});

  static const routePath = '/houses-view';
  static const routeName = 'houses-view';

  static Widget builder() {
    return const HousesView();
  }

  @override
  State<HousesView> createState() => _HousesViewState();
}

class _HousesViewState extends State<HousesView>
    with AutomaticKeepAliveClientMixin {
  final ValueNotifier<bool> _showActionsNotifier = ValueNotifier<bool>(true);
  final ScrollController _scrollController = ScrollController();
  final TextEditingController inArzanController = TextEditingController();
  final TextEditingController inGymmatController = TextEditingController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    BaseLogger.warning(' init houses');
    init();
    super.initState();
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HousesBloc>().add(const HousesEvent.refresh());
    });
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 300 && !_showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else if (_scrollController.offset < 300 && _showScrollToTopButton) {
      setState(() {
        _showScrollToTopButton = false;
      });
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _showActionsNotifier.value = false;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _showActionsNotifier.value = true;
    }
  }

  void _scrollToTop() {
    _showActionsNotifier.value = true;
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    inArzanController.dispose();
    inGymmatController.dispose();
    _scrollController.removeListener(_scrollListener);
    _showActionsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<HousesBloc, HousesState>(
        builder: (context, state) {
          final filter = state.globalOptions;
          final houses = state.houses;

          return Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    titleSpacing: 0,
                    primary: false,
                    floating: true,
                    toolbarHeight: 75.w,
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    backgroundColor: ColorName.main,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    title: Container(
                      decoration: const BoxDecoration(
                        color: ColorName.main,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ).w,
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchField(
                              onTap: () {},
                            ),
                          ),
                          10.boxW,
                          GestureDetector(
                            onTap: () {
                              if (filter?.data != null) {
                                context.push(
                                  HouseFiltersView.routePath,
                                  extra: HouseFilterRoute(
                                    globalOptions: filter!.data,
                                    bloc: context.read<HousesBloc>(),
                                  ),
                                );
                              }
                            },
                            child: SizedBox(
                              width: 35.w,
                              height: 35.w,
                              child: Assets.icons.icFilter.svg(package: 'gen'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(40.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          key: const Key('app_bar_actions'),
                          padding: const EdgeInsets.fromLTRB(14, 10, 14, 8).w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedBlueBorderedChipBtn(
                                onTap: () {},
                                title: 'Ýerleşýän ýeri',
                                icon:
                                    Assets.icons.icLocation.svg(package: 'gen'),
                              ),
                              6.boxW,
                              RoundedBlueBorderedChipBtn(
                                onTap: () {},
                                icon:
                                    Assets.icons.icCategory.svg(package: 'gen'),
                                title: 'Kategoriýa',
                              ),
                              6.boxW,
                              RoundedBlueBorderedChipBtn(
                                onTap: () {},
                                title: 'Bahasy',
                                icon: Assets.icons.icCost.svg(package: 'gen'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state.status.isLoading)
                    SliverFillRemaining(
                      child: LoadingIndicator.circle(),
                    ),
                  if (state.status.isFailure)
                    SliverFillRemaining(
                      child: TryAgainWidget(onTryAgain: () {}),
                    ),
                  if (state.status.isSuccess) ...[
                    // Main content area
                    6.boxH.toSliver,
                    SliverList.separated(
                      itemBuilder: (context, index) {
                        final house = houses?[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0).w,
                          child: MainHouseItem(house: house),
                        );
                      },
                      separatorBuilder: (context, index) => 5.boxH,
                      itemCount: houses?.length ?? 0,
                    ),
                    16.boxH.toSliver,
                  ],
                ],
              ),
              if (_showScrollToTopButton)
                Positioned(
                  right: 20.w,
                  bottom: 20.w,
                  child: AnimatedOpacity(
                    opacity: _showScrollToTopButton ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xff5A8FBB),
                      onPressed: _scrollToTop,
                      mini: true, // Smaller size for subtlety
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
