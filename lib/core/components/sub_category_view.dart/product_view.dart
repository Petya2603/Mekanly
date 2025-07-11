import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl/intl.dart';
import '../../../localization/extensions.dart';
import '../../../product/constants/constants.dart';
import '../../../remote/repositories/business_profile/product_cubit.dart';
import '../../../remote/repositories/business_profile/product_model.dart';
import '../search_field.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  void _loadInitialData() {
    context.read<ProductCubit>().fetchProducts(widget.categoryId);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      final state = context.read<ProductCubit>().state;
      if (state is ProductLoaded && state.hasMore) {
        context.read<ProductCubit>().fetchProducts(widget.categoryId);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildProductItem(Product product) {
    final pageController = PageController();
    final pageNotifier = ValueNotifier<int>(0);

    return Stack(
      children: [
        Container(
          width: 167.w,
          height: 225.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Carousel
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.r)),
                  child: product.images.isNotEmpty
                      ? Stack(
                          children: [
                            PageView.builder(
                              controller: pageController,
                              itemCount: product.images.length,
                              onPageChanged: (index) =>
                                  pageNotifier.value = index,
                              itemBuilder: (context, index) {
                                final imgUrl = product.images[index].original;
                                return Image.network(
                                  imgUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (_, __, ___) => Center(
                                    child: Assets.icons.imageyok.svg(
                                      package: 'gen',
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (product.images.length > 1)
                              Positioned(
                                bottom: 6.h,
                                left: 0,
                                right: 0,
                                child: ValueListenableBuilder<int>(
                                  valueListenable: pageNotifier,
                                  builder: (_, page, __) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        product.images.length,
                                        (index) => AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          width: page == index ? 8.w : 6.w,
                                          height: page == index ? 8.w : 6.w,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          decoration: BoxDecoration(
                                            color: page == index
                                                ? Colors.white
                                                : Colors.white54,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        )
                      : Center(
                          child: Assets.icons.imageyok.svg(
                            package: 'gen',
                          ),
                        ),
                ),
              ),
              // Product Info
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.description.isNotEmpty
                          ? product.description
                          : 'Gyssagly satiyk kwartira',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      // ignore: lines_longer_than_80_chars
                      '${product.price ?? 0} TMT',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Favorite Button
        Positioned(
          top: 8.w,
          right: 8.w,
          child: GestureDetector(
            onTap: () {
              // Toggle favorite
            },
            child: Container(
              child: product.favorited
                  ? Assets.icons.icFavoriteSelected.svg(
                      package: 'gen',
                      width: 24.r,
                      height: 24.r,
                    )
                  : Assets.icons.icFavoriteDarkFill.svg(
                      package: 'gen',
                      width: 24.r,
                      height: 24.r,
                    ),
            ),
          ),
        ),
        // ignore: use_if_null_to_convert_nulls_to_bools
        if (product.vip == true || product.exclusive == 1)
          Positioned(
            top: 8.w,
            left: 8.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.icons.vip.svg(
                  package: 'gen',
                  width: 27.r,
                  height: 29.r,
                ),
                Text(
                  // ignore: use_if_null_to_convert_nulls_to_bools
                  product.vip == true ? 'VIP' : 'exclusive',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 246, 152, 0),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 248, 255),
      appBar: AppBar(
        backgroundColor: ColorName.main,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Assets.icons.icFavorite.svg(
              package: 'gen',
            ),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 248, 248, 248),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: StringConstants.roboto,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading && state is! ProductLoaded) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.onmyok.svg(
                    package: 'gen',
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    context.translation.not_found,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF6A6A6A),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (state is ProductLoaded) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorName.main,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 64, 64, 64)
                              .withOpacity(0.25),
                          offset: const Offset(0, -3),
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 18.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SearchField(
                              onTap: () {},
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Assets.icons.icFilter.svg(
                            package: 'gen',
                            width: 35.w,
                            height: 35.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.w,
                    vertical: 9.h,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < state.products.length) {
                          return _buildProductItem(state.products[index]);
                        } else {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                      childCount:
                          state.products.length + (state.hasMore ? 1 : 0),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 167.w / 225.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
