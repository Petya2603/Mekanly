import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../core/components/app_bar/app_bar.dart';
import '../../core/components/app_btn.dart';
import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';
import '../../remote/entities/global_options/global_options.dart';
import '../../utils/extensions.dart';
import '../houses/bloc/houses_bloc.dart';
import 'widgets/area_slider_widget.dart';
import 'widgets/option_categories_modal_sheet.dart';
import 'widgets/option_chip_widget.dart';
import 'widgets/option_holder_switcher.dart';
import 'widgets/option_locations_modal_sheet.dart';
import 'widgets/options_modal_dialog.dart';
import 'widgets/price_selector_widget.dart';
import 'widgets/titled_selector_widget.dart';
import 'widgets/titled_switcher.dart';
import 'widgets/type_selector_widget.dart';

class HouseFilterRoute {
  HouseFilterRoute({
    required this.globalOptions,
    required this.bloc,
  });

  final GlobalOptions globalOptions;
  final HousesBloc bloc;
}

class HouseFiltersView extends StatefulWidget {
  const HouseFiltersView({super.key, required this.filter});

  static const routePath = '/house-filter-view';
  static const routeName = 'house-filter-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    return HouseFiltersView(
      filter: state.extra! as HouseFilterRoute,
    );
  }

  final HouseFilterRoute filter;

  @override
  State<HouseFiltersView> createState() => _HouseFiltersViewState();
}

class _HouseFiltersViewState extends State<HouseFiltersView> {
  List<Location> locations = [];
  List<CategoryHouse> categories = [];

  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  late RangeValues rangeValues = const RangeValues(20, 500);
  late RangeValues initValues = const RangeValues(20, 500);

  void onChangeValue(RangeValues value) {
    if (value.start >= (value.end - 2)) {
      return;
    }
    setState(() {
      rangeValues = value;
    });
  }

  List<SubLocations>? currentLoc;
  List<CategoryHouse>? currentCategory;
  List<PropertyType>? currentPropertyTypes;
  bool justShowWithImage = false;
  bool justShowNewAdded = false;
  bool fromHolder = false;
  BaseOptionModel? propertyOptionModel;
  BaseOptionModel? repairOptionModel;
  BaseOptionModel? possibilityOptionModel;
  List<HouseFloorCount>? floorCounts;
  List<HouseFloorCount>? roomCounts;

  @override
  void initState() {
    onInit();
    super.initState();
  }




  /// TODOS: should be optimized later, should take these method to the mixin of HouseFiltersView
  void onInit() {
    initValues = const RangeValues(20, 500);
    final minArea = widget.filter.globalOptions.minArea ?? 20;
    final maxArea = widget.filter.globalOptions.maxArea ?? 500;
    rangeValues = RangeValues(
      minArea.toDouble(),
      maxArea.toDouble(),
    );
    final minPrice = widget.filter.globalOptions.minPrice;
    final maxPrice = widget.filter.globalOptions.maxPrice;
    minPriceController.text = minPrice != null ? minPrice.toString() : '';
    maxPriceController.text = maxPrice != null ? maxPrice.toString() : '';

    roomCounts = List.of(widget.filter.globalOptions.roomCount ?? []);
    floorCounts = List.of(widget.filter.globalOptions.floorCount ?? []);

    fromHolder = widget.filter.globalOptions.fromHolder ?? true;
    justShowNewAdded = widget.filter.globalOptions.justShowNewAdded ?? false;
    justShowWithImage = widget.filter.globalOptions.justShowWithImage ?? false;

    locations = List.of(widget.filter.globalOptions.locations);
    categories = List.of(widget.filter.globalOptions.categoryHouses);
    currentLoc = List.of(locations.getAllSelected ?? []);
    currentCategory = List.of(categories.getAllSelected ?? []);
    propertyOptionModel = BaseOptionModel(
      type: OptionTypes.property,
      propertyTypes: List.of(widget.filter.globalOptions.propertyType),
      selectedPropertyTypes:
          List.of(widget.filter.globalOptions.selectedPropertyType ?? []),
    );
    repairOptionModel = BaseOptionModel(
      type: OptionTypes.repair,
      repairTypes: List.of(widget.filter.globalOptions.repairType),
      selectedRepairTypes:
          List.of(widget.filter.globalOptions.selectedRepairType ?? []),
    );
    possibilityOptionModel = BaseOptionModel(
      type: OptionTypes.possibility,
      possibilities: List.of(widget.filter.globalOptions.possibility),
      selectedPossibilities:
          List.of(widget.filter.globalOptions.selectedPossibility ?? []),
    );
  }

  void onApply() {
    final bloc = widget.filter.bloc;
    final selectedFloorCount =
        floorCounts?.where((fl) => fl.isSelected).toList();
    final selectedRoomCount = roomCounts?.where((rm) => rm.isSelected).toList();

    final filter = widget.filter.globalOptions.copyWith(
      categoryHouses: categories,
      selectedCategoryHouses: currentCategory,
      selectedSubLocations: currentLoc,
      selectedFloorCount: selectedFloorCount,
      selectedRoomCount: selectedRoomCount,
      locations: locations,
      floorCount: floorCounts,
      roomCount: roomCounts,
      fromHolder: fromHolder,
      justShowNewAdded: justShowNewAdded,
      justShowWithImage: justShowWithImage,
      maxArea: rangeValues.end.toInt(),
      minArea: rangeValues.start.toInt(),
      maxPrice: int.tryParse(maxPriceController.text),
      minPrice: int.tryParse(minPriceController.text),
      possibility: possibilityOptionModel?.possibilities ?? [],
      repairType: repairOptionModel?.repairTypes ?? [],
      propertyType: propertyOptionModel?.propertyTypes ?? [],
      selectedPossibility: possibilityOptionModel?.selectedPossibilities,
      selectedPropertyType: propertyOptionModel?.selectedPropertyTypes,
      selectedRepairType: repairOptionModel?.selectedRepairTypes,
    );

    bloc.add(HousesEvent.filter(filter));

    if (context.canPop()) {
      context.pop();
    }
  }

  void clearAllFilter() {}

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24).w,
        // width: MediaQuery.of(context).size.width * 0.75,
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
                onTap: onApply,
                fontSize: 14.sp,
                textColor: Colors.white,
                text: 'GÖZLE',
                fontWeight: FontWeight.w500,
                fontFamily: StringConstants.roboto,
                bgColor: ColorName.main,
                //padding:const EdgeInsets.symmetric(horizontal: 24).w,
              ),
            ),
          ],
        ),
      ),
      appBar: CustomAppBar.base(
        title: 'Filterler',
        actions: [
          TextBtn(
            child: AppText.s14w400BdM(
              'Arassala',
              color: Colors.white,
            ),
            onTap: () {},
          ),
          16.boxW,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.boxH,
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              dense: true,
              minVerticalPadding: 0,
              title: AppText.s14w400BdM(
                'Bölüm',
                fontSize: 15.sp,
                fontFamily: StringConstants.roboto,
              ),
              subtitle: AppText.s10w400LbS(
                (currentCategory?.nameAll?.isEmpty ?? true)
                    ? 'Saýlanmadyk'
                    : currentCategory?.nameAll ?? '',
                color: const Color(0xff717171),
                fontFamily: StringConstants.roboto,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
              onTap: () async {
                final updated = await OptionCategoryModalBottomSheet.show(
                  context,
                  categories: categories,
                );

                if (updated != null) {
                  setState(() {
                    categories = List<CategoryHouse>.from(updated);
                    currentCategory = List.of(updated.getAllSelected ?? []);
                  });
                }
              },
            ),
            Divider(
              height: 1,
              endIndent: 6.w,
              indent: 6.w,
              color: const Color(0xffDCDCDC),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              dense: true,
              minVerticalPadding: 0,
              title: AppText.s14w400BdM(
                'Ýerleşýän ýeri',
                fontSize: 15.sp,
                fontFamily: StringConstants.roboto,
              ),
              subtitle: AppText.s10w400LbS(
                (currentLoc?.nameAll?.isEmpty ?? true)
                    ? 'Saýlanmadyk'
                    : currentLoc?.nameAll ?? '',
                color: const Color(0xff717171),
                fontFamily: StringConstants.roboto,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
              onTap: () async {
                final updated = await OptionModalBottomSheet.showOptionModal(
                  context,
                  locations: locations,
                );

                if (updated != null) {
                  setState(() {
                    locations = List.of(updated);
                    currentLoc = List.of(updated.getAllSelected ?? []);
                  });
                }
              },
            ),
            Divider(
              height: 1,
              endIndent: 6.w,
              indent: 6.w,
              color: const Color(0xffDCDCDC),
            ),
            8.boxH,
            TitledSelectorView(
              title: 'Otag sany',
              list: roomCounts ?? [],
              valueChanged: (value) {
                final updated =
                    List<HouseFloorCount>.from(roomCounts ?? []).update(
                  value.index,
                  value,
                );

                setState(() {
                  roomCounts = List.of(updated);
                });
              },
            ),
            20.boxH,
            TitledSelectorView(
              title: 'Gat sany',
              list: floorCounts ?? [],
              valueChanged: (value) {
                final updated =
                    List<HouseFloorCount>.from(floorCounts ?? []).update(
                  value.index,
                  value,
                );

                setState(() {
                  floorCounts = List.of(updated);
                });
              },
            ),
            24.boxH,
            TitledSwitcherWidget(
              onChanged: (value) {
                setState(() {
                  justShowWithImage = value;
                });
              },
              title: 'Diňe  suratly jaýlary görkez',
              accepted: justShowWithImage,
            ),
            20.boxH,
            TitledSwitcherWidget(
              onChanged: (value) {
                setState(() {
                  justShowNewAdded = value;
                });
              },
              title: 'Täze goşulan emläklery görkez',
              accepted: justShowNewAdded,
            ),
            20.boxH,
            const Divider(
              height: 1,
              color: Color(0xffDCDCDC),
            ),
            12.boxH,
            TypeSelectorWidget(
              padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 14).w,
              title: 'Emläk görnüşi',
              onTap: () async {
                if (propertyOptionModel == null) return;
                final updated = await showModalOptions(
                  context,
                  text: 'Emläk görnüşi',
                  model: propertyOptionModel!,
                );

                if (updated != null) {
                  propertyOptionModel = updated;
                  setState(() {});
                }
              },
              selectedItems:
                  propertyOptionModel?.selectedPropertyTypes?.map((p) {
                return OptionChipWidget(
                  title: p.name,
                  icon: p.buildIcon,
                );
              }).toList(),
            ),
            12.boxH,
            TypeSelectorWidget(
              padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 14).w,
              title: 'Remont',
              onTap: () async {
                if (repairOptionModel == null) return;
                final updated = await showModalOptions(
                  context,
                  text: 'Remont görnüşi',
                  model: repairOptionModel!,
                );

                if (updated != null) {
                  repairOptionModel = updated;
                  setState(() {});
                }
              },
              selectedItems: repairOptionModel?.selectedRepairTypes?.map((p) {
                return OptionChipWidget(
                  title: p.name,
                );
              }).toList(),
            ),
            12.boxH,
            TypeSelectorWidget(
              padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 14).w,
              title: 'Mümkinçilikler',
              selectedItems:
                  possibilityOptionModel?.selectedPossibilities?.map((p) {
                return OptionChipWidget(
                  title: p.name,
                  icon: p.buildIcon,
                );
              }).toList(),
              onTap: () async {
                if (possibilityOptionModel == null) return;
                final updated = await showModalOptions(
                  context,
                  text: 'Mümkinçilikler',
                  model: possibilityOptionModel!,
                );

                if (updated != null) {
                  possibilityOptionModel = updated;
                  setState(() {});
                }
              },
            ),
            18.boxH,
            OptionHolderSwitcher(
              isOwner: fromHolder,
              onChanged: (value) {
                setState(() {
                  fromHolder = value;
                });
              },
            ),
            18.boxH,
            AreaSliderWidget(
              onChanged: onChangeValue,
              rangeValues: rangeValues,
              initValues: initValues,
            ),
            18.boxH,
            PriceSelectorWidget(
              minPriceController: minPriceController,
              maxPriceController: maxPriceController,
            ),
            56.boxH,
          ],
        ),
      ),
    );
  }
}
