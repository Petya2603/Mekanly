import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../../core/components/app_text.dart';
import '../../../product/constants/constants.dart';
import '../../../utils/extensions.dart';
import '../../business_porfile/business_profile.dart';
import '../../favorites/favorites_view.dart';
import '../../home/home_view.dart';
import '../../houses/houses_view.dart';
import '../../menu/menu_view.dart';
import '../widgets/custom_scroll_controller.dart';
import 'root_view_handler.dart';

class RootView extends StatefulWidget {
  const RootView({
    super.key,
  });

  // final StatefulNavigationShell navigationShell;

  static const routePath = '/root-view';
  static const routeName = 'root-view';

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final CustomScrollController _scrollController = CustomScrollController();
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _onTabSelected(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (index == _currentIndex) return;

    if (index != 0) {
      _scrollController.animateTo(
        35.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _scrollController.appBarVisibility.value = false;
    } else {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _scrollController.appBarVisibility.value = true;
    }

    setState(() {
      _currentIndex = index;
    });

    _tabController.animateTo(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final physics = _currentIndex == 0
        ? const AlwaysScrollableScrollPhysics()
        : const NeverScrollableScrollPhysics();

    return Scaffold(
      backgroundColor: ColorName.main,
      body: Container(
        color: ColorName.white,
        margin: EdgeInsets.only(top: context.mediaQuery.padding.top),
        child: NestedScrollView(
          physics: physics,
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomSliverAppBar(
                visibilityNotifier: _scrollController.appBarVisibility,
                scrollController: _scrollController,
                backgroundColor: ColorName.main,
                shadowColor: Colors.black26,
                height: 35.w,
                currentTabIndex: _currentIndex,
                title: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 20.w,
                          child:
                              Assets.icons.icLogoAppbar.image(package: 'gen'),
                        ).toLeft(),
                      ),
                      Assets.icons.icNotif.svg(package: 'gen'),
                    ],
                  ),
                ),
                bottom: _buildBottomNavigation(),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeView(
                key: Key('home_view'),
              ),
              HousesView(
                key: Key('houses_view'),
              ),
              BusinessProfileView(
                key: Key('business_profile_view'),
              ),
              FavoritesView(
                key: Key('favorites_view'),
              ),
              MenuView(
                key: Key('menu_view'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).w,
      child: Row(
        children: List.generate(
          navigationPages(context).length,
          (index) {
            final page = navigationPages(context)[index];
            return Expanded(
              child: InkWell(
                onTap: () => _onTabSelected(index),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 6).w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 20.w,
                        height: 20.w,
                        child: _currentIndex == page.index
                            ? page.activeIcon.svg(package: 'gen')
                            : page.icon.svg(package: 'gen'),
                      ),
                      4.boxH,
                      AppText.s12w400BdS(
                        page.label,
                        fontSize: 9.sp,
                        textAlign: TextAlign.center,
                        color: page.index == _currentIndex
                            ? ColorName.white
                            : ColorName.cardShadow,
                        fontWeight: page.index == _currentIndex
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontFamily: StringConstants.roboto,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
