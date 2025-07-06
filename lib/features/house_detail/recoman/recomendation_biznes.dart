import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../../../core/components/app_text.dart' show AppText;
import '../../../remote/repositories/recomandation/recoman_reperizitory.dart';

class RecommendedHousesSectionBiznes extends StatefulWidget {
  const RecommendedHousesSectionBiznes({super.key});

  @override
  State<RecommendedHousesSectionBiznes> createState() =>
      _RecommendedHousesSectionState();
}

class _RecommendedHousesSectionState
    extends State<RecommendedHousesSectionBiznes> {
  late final RecommendationProvider _provider;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    _provider = RecommendationProvider(HouseRepository(dio));
    _provider.fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<RecommendationProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return SizedBox(
              height: 200.h,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (provider.error != null) {
            return Padding(
              padding: EdgeInsets.all(12.w),
              child: Text('Error: ${provider.error}'),
            );
          }

          if (provider.recommendations.isEmpty) {
            return const SizedBox.shrink();
          }

          return SizedBox(
            height:
                ((MediaQuery.of(context).size.width * 0.35 * 198) / 131) + 12.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: provider.recommendations.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return BusinessCard(house: provider.recommendations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.house});
  final HouseEntity house;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.35;

    final logoUrl = house.logo ?? house.images?.firstOrNull?.url ?? '';
    final title = house.name ?? '';
    final description = house.description ?? '';
    final phone = house.phone ?? '';

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.r),
            child: Image.network(
              logoUrl,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.image, size: 60.w),
            ),
          ),
          8.boxH,
          AppText.s14w400BdM(
            title,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          4.boxH,
          AppText.s14w400BdM(
            description,
            fontSize: 10.sp,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            color: Colors.grey[700],
          ),
          6.boxH,
          AppText.s14w400BdM(
            phone,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

extension Box on num {
  SizedBox get boxH => SizedBox(height: toDouble().h);
  SizedBox get boxW => SizedBox(width: toDouble().w);
}

extension PriceFormatting on String {
  String formatPrice() {
    final numValue = double.tryParse(this) ?? 0;
    return '${numValue.toStringAsFixed(0)} TMT';
  }
}
