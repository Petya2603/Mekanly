import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../core/components/app_text.dart';
import '../../core/components/buisnes_profile_card.dart';
import '../../core/components/categories_card.dart';
import '../../core/components/loading_indicator.dart';
import '../../core/components/search_field.dart';
import '../../core/components/try_again_widget.dart';
import '../../localization/extensions.dart';
import '../../product/base/base_status/base_status.dart';
import '../../product/constants/constants.dart';
import '../../utils/constants.dart';
import '../../utils/extensions.dart';
import 'cubit/business_profile_cubit.dart';

class BusinessProfileView extends StatefulWidget {
  const BusinessProfileView({super.key});

  static const routePath = '/business-profile-view';
  static const routeName = 'business-profile-view';

  @override
  State<BusinessProfileView> createState() => _BusinessProfileViewState();
}

class _BusinessProfileViewState extends State<BusinessProfileView>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  Future<void> init() async {
    BaseLogger.warning('BusinessProfileView init');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<BusinessProfileCubit>().init();
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<BusinessProfileCubit, BusinessProfileState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return LoadingIndicator.circle();
          }

          if (state.status.isFailure) {
            return TryAgainWidget(
              onTryAgain: () async {
                await context.read<BusinessProfileCubit>().init();
              },
            );
          }
          final categories = state.categoryResponse?.data;
          final profiles = state.response?.data;
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 18)
                          .w,
                  child: SearchField(
                    onTap: () {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 238.w,
                  width: double.infinity,
                  child: Image.asset(AppConstants.businessProfileImg),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CategoriesCard(
                    categories: categories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                  child: AppText.s14w400BdM(
                    context.translation.business_profiles,
                    fontFamily: StringConstants.roboto,
                    color: ColorName.black,
                  ),
                ),
              ),
              SliverList.separated(
                key: const Key('business_profile_card'),
                itemBuilder: (context, index) {
                  final profile = profiles?[index];
                  return BusinessProfileCard(
                    profile: profile,
                  );
                },
                separatorBuilder: (context, index) => 5.boxH,
                itemCount: profiles?.length,
              ),
              24.boxH.toSliver,
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
