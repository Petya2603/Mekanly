// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/components/app_bar/app_bar.dart';
import '../../core/components/app_btn.dart';
import '../../core/components/app_text.dart';
import '../../core/components/inputs/app_input.dart';
import '../../core/components/inputs/phone_filed.dart';
import '../../core/components/loader.dart';
import '../../product/base/base_status/base_status.dart';
import '../../product/constants/constants.dart';
import '../../product/helpers/helpers.dart';
import '../../product/injection/injector.dart';
import '../../remote/entities/global_options/global_options.dart';
import '../../remote/response_error.dart';
import '../../utils/extensions.dart';
import '../house_filters/widgets/option_categories_modal_sheet.dart';
import '../house_filters/widgets/option_chip_widget.dart';
import '../house_filters/widgets/option_holder_switcher.dart';
import '../house_filters/widgets/option_locations_modal_sheet.dart';
import '../house_filters/widgets/options_modal_dialog.dart';
import '../house_filters/widgets/titled_selector_widget.dart';
import '../house_filters/widgets/titled_switcher.dart';
import '../house_filters/widgets/type_selector_widget.dart';
import 'cubit/add_house_cubit.dart';
import 'model/add_house_payload.dart';
import 'widgets/dialogs.dart';
import 'widgets/image_picker_widget.dart';
import 'widgets/selected_images_widget.dart';

enum AddHouseType {
  house,
  office,
}

class AddHouseView extends StatefulWidget {
  const AddHouseView({super.key, this.options});

  static const routePath = '/add-house-view';
  static const routeName = 'add-house-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    final bloc = injector<AddHouseCubit>();
    return BlocProvider(
      create: (context) => bloc,
      child: AddHouseView(
        options: state.extra as GlobalOptions?,
      ),
    );
  }

  final GlobalOptions? options;

  @override
  State<AddHouseView> createState() => _AddHouseViewState();
}

class _AddHouseViewState extends State<AddHouseView> {
  final ImagePicker _picker = ImagePicker();
  bool initDone = false;

  AddHouseType type = AddHouseType.house;

  List<Location> locations = [];
  List<CategoryHouse> categories = [];

  @override
  void initState() {
    super.initState();
    if (widget.options != null) {
      init(widget.options);
    }
  }

  final TextEditingController priceController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<SubLocations>? currentLoc;
  List<CategoryHouse>? currentCategory;
  List<PropertyType>? currentPropertyTypes;
  int canWriteComment = 0;
  bool acceptedPrivacy = false;
  bool? fromHolder;
  BaseOptionModel? propertyOptionModel;
  BaseOptionModel? repairOptionModel;
  BaseOptionModel? possibilityOptionModel;
  List<HouseFloorCount>? floorCounts;
  List<HouseFloorCount>? roomCounts;
  List<HouseFloorCount>? levelCounts;

  void init(GlobalOptions? options) {
    if (options == null) {
      return;
    }

    locations = options.locations;
    categories = options.categoryHouses;
    floorCounts = options.floorCountHouse;
    roomCounts = options.roomCountHouse;
    levelCounts = options.levelCountHouse;

    propertyOptionModel = BaseOptionModel(
      type: OptionTypes.property,
      propertyTypes: List.of(options.propertyType),
      selectedPropertyTypes: List.of(options.selectedPropertyType ?? []),
    );
    repairOptionModel = BaseOptionModel(
      type: OptionTypes.repair,
      repairTypes: List.of(options.repairType),
      selectedRepairTypes: List.of(options.selectedRepairType ?? []),
    );
    possibilityOptionModel = BaseOptionModel(
      type: OptionTypes.possibility,
      possibilities: List.of(options.possibility),
      selectedPossibilities: List.of(options.selectedPossibility ?? []),
    );

    initDone = true;

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    priceController.dispose();
    areaController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddHouseCubit, AddHouseState>(
      listener: (context, state) async {
        if (state.addHouseStatus.isLoading && context.mounted) {
          await TitledLoadingDialog.show(context);
        }

        if (context.mounted && state.addHouseStatus.isFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          Helpers.showToastInfo(
            context,
            state.addHouseStatus.maybeWhen(
              orElse: () => '',
              failure: (e) {
                return e.getErrorMessage(context);
              },
            ),
          );
        }

        if (context.mounted && state.addHouseStatus.isSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          final ok = await ToNotifyUser.show(context);
          if ((ok ?? false) && context.mounted) {
            context.pop(true);
          }
        }
      },
      builder: (context, state) {
        final isSelecting = state.pickImageStatus;
        // final pickedImages = state.pickedImages;
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar.base(title: 'Jaý goşmak'),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.s14w400BdM(
                        'Ady',
                        fontSize: 15.sp,
                        fontFamily: StringConstants.roboto,
                      ),
                      AppInput(
                        controller: nameController,
                        hintText: 'Emlägiňiziň gysgaça adyny ýazyň',
                      ),
                      8.boxH,
                      ListTile(
                        dense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4).w,
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
                          final updated =
                              await OptionCategoryModalBottomSheet.show(
                            context,
                            categories: categories,
                            isSingle: true,
                          );

                          if (updated != null) {
                            setState(() {
                              categories = List<CategoryHouse>.from(updated);
                              final selected = updated.getSelected;
                              if (selected != null) {
                                type = updated.indexOf(selected) > 2
                                    ? AddHouseType.office
                                    : AddHouseType.house;
                              }
                              currentCategory =
                                  List.of(updated.getAllSelected ?? []);
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
                        dense: true,
                        minVerticalPadding: 0,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4).w,
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
                          final updated =
                              await OptionModalBottomSheet.showOptionModal(
                            context,
                            locations: locations,
                            isSingle: true,
                          );

                          if (updated != null) {
                            setState(() {
                              locations = List.of(updated);
                              currentLoc =
                                  List.of(updated.getAllSelected ?? []);
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
                        title: 'Binanyň gat sany',
                        padding: EdgeInsets.zero,
                        list: levelCounts ?? [],
                        valueChanged: (value) {
                          final list =
                              List<HouseFloorCount>.from(levelCounts ?? []);
                          final emptied = list
                              .map((e) => e.copyWith(isSelected: false))
                              .toList();
                          final updated =
                              List<HouseFloorCount>.from(emptied).update(
                            value.index,
                            value,
                          );

                          setState(() {
                            levelCounts = List.of(updated);
                          });
                        },
                      ),
                      6.boxH,
                      TitledSelectorView(
                        title: 'Otag sany',
                        padding: EdgeInsets.zero,
                        list: roomCounts ?? [],
                        valueChanged: (value) {
                          final list =
                              List<HouseFloorCount>.from(roomCounts ?? []);
                          final emptied = list
                              .map((e) => e.copyWith(isSelected: false))
                              .toList();
                          final updated =
                              List<HouseFloorCount>.from(emptied).update(
                            value.index,
                            value,
                          );

                          setState(() {
                            roomCounts = List.of(updated);
                          });
                        },
                      ),
                      6.boxH,
                      TitledSelectorView(
                        padding: EdgeInsets.zero,
                        title: 'Gat sany',
                        list: floorCounts ?? [],
                        valueChanged: (value) {
                          final list =
                              List<HouseFloorCount>.from(floorCounts ?? []);
                          final emptied = list
                              .map((e) => e.copyWith(isSelected: false))
                              .toList();
                          final updated =
                              List<HouseFloorCount>.from(emptied).update(
                            value.index,
                            value,
                          );

                          setState(() {
                            floorCounts = List.of(updated);
                          });
                        },
                      ),
                      16.boxH,
                      ImagePickerWidget(
                        onTap: () {
                          if (!state.pickImageStatus.isLoading) {
                            context
                                .read<AddHouseCubit>()
                                .pickAndProcessImages(picker: _picker);
                          }
                        },
                        pickedImages: state.pickedImages,
                      ),
                      if (state.pickedImages?.isNotEmpty ?? false) ...[
                        10.boxH,
                        SelectedImagesWidget(
                          pickedImages: state.pickedImages,
                          onRemove: (value) {
                            context.read<AddHouseCubit>().removeImage(value);
                          },
                        ),
                      ],
                      12.boxH,
                      const Divider(
                        height: 1,
                        color: Color(0xffDCDCDC),
                      ),
                      10.boxH,
                      TypeSelectorWidget(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 14,
                        ).w,
                        title: 'Mümkinçilikler',
                        selectedItems: possibilityOptionModel
                            ?.selectedPossibilities
                            ?.map((p) {
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
                            isSingle: true,
                          );

                          if (updated != null) {
                            possibilityOptionModel = updated;
                            setState(() {});
                          }
                        },
                      ),
                      12.boxH,
                      if (type == AddHouseType.house) ...[
                        TypeSelectorWidget(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 14,
                          ).w,
                          title: 'Remont',
                          onTap: () async {
                            if (repairOptionModel == null) return;
                            final updated = await showModalOptions(
                              context,
                              text: 'Remont görnüşi',
                              model: repairOptionModel!,
                              isSingle: true,
                            );

                            if (updated != null) {
                              repairOptionModel = updated;
                              setState(() {});
                            }
                          },
                          selectedItems:
                              repairOptionModel?.selectedRepairTypes?.map((p) {
                            return OptionChipWidget(
                              title: p.name,
                            );
                          }).toList(),
                        ),
                        12.boxH,
                        TypeSelectorWidget(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 14,
                          ).w,
                          title: 'Emläk görnüşi',
                          onTap: () async {
                            if (propertyOptionModel == null) return;
                            final updated = await showModalOptions(
                              context,
                              text: 'Emläk görnüşi',
                              model: propertyOptionModel!,
                              isSingle: true,
                            );

                            if (updated != null) {
                              propertyOptionModel = updated;
                              setState(() {});
                            }
                          },
                          selectedItems: propertyOptionModel
                              ?.selectedPropertyTypes
                              ?.map((p) {
                            return OptionChipWidget(
                              title: p.name,
                              icon: p.buildIcon,
                            );
                          }).toList(),
                        ),
                      ],
                      10.boxH,
                      AppInput(
                        hintText:
                            'Doly ady, aýratynlygy, ýagdaýy we ş.m maglmat ',
                        controller: descriptionController,
                      ),
                      10.boxH,
                      OptionHolderSwitcher(
                        padding: EdgeInsets.zero,
                        isOwner: fromHolder,
                        onChanged: (value) {
                          setState(() {
                            fromHolder = value;
                          });
                        },
                      ),
                      10.boxH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText.s14w400BdM(
                            'Meýdany:',
                            fontSize: 16.sp,
                            fontFamily: StringConstants.roboto,
                          ),
                          6.boxW,
                          SizedBox(
                            width: 100.w,
                            child: AppInput(
                              controller: areaController,
                              type: TextInputType.number,
                            ),
                          ),
                          6.boxW,
                          AppText.s14w400BdM(
                            'm²',
                            fontSize: 16.sp,
                            fontFamily: StringConstants.roboto,
                          ),
                        ],
                      ),
                      5.boxH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText.s14w400BdM(
                            'Bahasy:',
                            fontSize: 16.sp,
                            fontFamily: StringConstants.roboto,
                          ),
                          6.boxW,
                          SizedBox(
                            width: 100.w,
                            child: AppInput(
                              type: TextInputType.number,
                              controller: priceController,
                            ),
                          ),
                          6.boxW,
                          AppText.s14w400BdM(
                            'TMT',
                            fontSize: 16.sp,
                            fontFamily: StringConstants.roboto,
                          ),
                        ],
                      ),
                      5.boxH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText.s14w400BdM(
                            'Telefon Belgiňiz:',
                            fontSize: 16.sp,
                            fontFamily: StringConstants.roboto,
                          ),
                          12.boxW,
                          Expanded(
                            child: PhoneFiled(
                              controller: phoneController,
                            ),
                          ),
                        ],
                      ),
                      16.boxH,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13).r,
                          color: const Color(0xffF6F6F6),
                        ),
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8).w,
                        child: Row(
                          children: [
                            Expanded(
                              child: AppText.s12w400BdS(
                                '#Heşteg',
                                fontFamily: StringConstants.roboto,
                                color: const Color(0xff555555),
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Assets.icons.icHash.svg(package: 'gen'),
                            ),
                          ],
                        ),
                      ),
                      16.boxH,
                      JustInOurAppWidget(
                        onChanged: (value) {},
                        value: false,
                      ),
                      16.boxH,
                      TitledSwitcherWidget(
                        padding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            acceptedPrivacy = value;
                          });
                        },
                        title: 'Dügünnamany okadym kabul etdim',
                        accepted: acceptedPrivacy,
                      ),
                      10.boxH,
                      TitledSwitcherWidget(
                        padding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            canWriteComment = value ? 1 : 0;
                          });
                        },
                        title: 'Ulanyjylar teswir ýazyp bilýärler',
                        accepted: canWriteComment == 1,
                      ),
                      24.boxH,
                      AppBtn(
                        onTap: () => checkIfValidate(state.pickedImages),
                        text: 'Tassyklamak',
                        bgColor: ColorName.black,
                      ),
                      24.boxH,
                    ],
                  ),
                ),
              ),
            ),
            if (isSelecting.isLoading) const Positioned.fill(child: Loader()),
          ],
        );
      },
    );
  }

  Future<void> checkIfValidate(List<ImageItem>? pickedImages) async {
    final locationId = currentLoc?.map((l) => l.id).toList().firstOrNull;
    final categoryId = currentCategory?.map((l) => l.id).toList().firstOrNull;
    final possibilities = possibilityOptionModel?.possibilities
        ?.where((p) => p.selected)
        .toList()
        .map((p) => p.id)
        .toList();
    final propertyTypeId = type == AddHouseType.house
        ? propertyOptionModel?.propertyTypes
            ?.where((p) => p.selected)
            .toList()
            .map((p) => p.id)
            .firstOrNull
        : null;
    final repairTypeId = type == AddHouseType.house
        ? repairOptionModel?.repairTypes
            ?.where((p) => p.selected)
            .toList()
            .map((p) => p.id)
            .firstOrNull
        : null;
    final floorNumber = floorCounts?.where((f) => f.isSelected).firstOrNull;
    final roomNumber = roomCounts?.where((f) => f.isSelected).firstOrNull;
    final levelNumber = levelCounts?.where((f) => f.isSelected).firstOrNull;

    if (nameController.text.isEmpty) {
      Helpers.showToastInfo(context, 'Emlagin adyny girizin');
      return;
    }

    if (currentCategory == null) {
      Helpers.showToastInfo(context, 'Bolum saylan');
      return;
    }

    if (locationId == null) {
      Helpers.showToastInfo(context, 'Ýerleşýän ýeri saylan');
      return;
    }

    if (possibilities?.isEmpty ?? true) {
      Helpers.showToastInfo(context, 'Mümkinçilikleri saylan');
      return;
    }
    if (descriptionController.text.isEmpty) {
      Helpers.showToastInfo(context, 'Maglumat girizn');
      return;
    }

    if (fromHolder == null) {
      Helpers.showToastInfo(context, 'Eýesi/Rieltor girizin');
      return;
    }

    if (areaController.text.isEmpty) {
      Helpers.showToastInfo(context, 'Meýdany girizn');
      return;
    }

    if (priceController.text.isEmpty) {
      Helpers.showToastInfo(context, 'Bahasyny girizn');
      return;
    }

    if (phoneController.text.length < 9) {
      Helpers.showToastInfo(context, 'Telefon Belgiňizi girizin');
      return;
    }

    if (!acceptedPrivacy) {
      Helpers.showToastInfo(context, 'Dügünnama bilen tanysyn');
      return;
    }

    // if(currentLoc)

    final data = AddHousePayload(
      bronNumber: phoneController.text,
      name: nameController.text,
      description: descriptionController.text,
      price: int.parse(priceController.text),
      location_id: locationId,
      category_id: categoryId!,
      possibilities: possibilities!,
      who: false,
      area: int.parse(areaController.text),
      write_comment: canWriteComment,
      floor_number:
          floorNumber?.count != null ? int.parse(floorNumber!.count) : null,
      room_number:
          roomNumber?.count != null ? int.parse(roomNumber!.count) : null,
      hashtag: null,
      level_number:
          levelNumber?.count != null ? int.parse(levelNumber!.count) : null,
      property_type_id: propertyTypeId,
      repair_type_id: repairTypeId,
    );

    final agreed = await AskIfAgreed.show(context);
    if (agreed == null) return;
    if (agreed) {
      await context.read<AddHouseCubit>().addHouse(data);
    }
  }

  void validate({required bool shouldShow, required String text}) {
    if (shouldShow) {
      Helpers.showToastInfo(context, text);
      return;
    }
  }
}

class ImageItem with EquatableMixin {
  ImageItem({
    required this.image,
    required this.progress,
    required this.isComplete,
  });
  final XFile image;
  final double progress;
  final bool isComplete;

  @override
  List<Object?> get props => [image, progress, isComplete];

  ImageItem copyWith({
    XFile? image,
    double? progress,
    bool? isComplete,
  }) {
    return ImageItem(
      progress: progress ?? this.progress,
      isComplete: isComplete ?? this.isComplete,
      image: image ?? this.image,
    );
  }
}

class JustInOurAppWidget extends StatelessWidget {
  const JustInOurAppWidget({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged.call(!value),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 5, 10, 5).w,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff717171),
            width: 1.2.w,
          ),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.s12w400BdS(
                    'Diňe mekanly.com-da',
                    fontFamily: StringConstants.roboto,
                  ),
                  8.boxH,
                  AppText.s10w400LbS(
                    'Bu funksiýa öz tanyşlaryňdan ýagny mekanly.com-a agza bolan tanyşlaryňdan platformadaky hereketiňi gizlemek üçin niýetlenendir. Bu funksiýany açsaňyz siziň kontaktyňyzdaky mekanly.com-a agza bolan ulanjylardan gizlener.',
                    fontFamily: StringConstants.roboto,
                    color: const Color(0xff717171),
                  ),
                ],
              ),
            ),
            12.boxW,
            Transform.scale(
              scale: .7,
              child: CupertinoSwitch(
                value: value,
                activeTrackColor: ColorName.black,
                onChanged: (value) => onChanged.call(!value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
