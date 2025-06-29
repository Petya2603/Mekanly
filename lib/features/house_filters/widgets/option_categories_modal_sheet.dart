import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_text.dart';
import '../../../localization/extensions.dart';
import '../../../product/helpers/helpers.dart';
import '../../../remote/entities/global_options/global_options.dart';
import '../../../utils/extensions.dart';
import 'option_locations_modal_sheet.dart';

class OptionCategoryModalBottomSheet extends StatefulWidget {
  const OptionCategoryModalBottomSheet({
    super.key,
    required this.categories,
    this.isSingle = false,
  });
  final List<CategoryHouse> categories;
  final bool isSingle;

  static Future<List<CategoryHouse>?> show(
    BuildContext context, {
    required List<CategoryHouse> categories,
    bool isSingle = false,
  }) async {
    return showModalBottomSheet<List<CategoryHouse>?>(
      context: context,
      builder: (context) {
        return OptionCategoryModalBottomSheet(
          categories: categories,
          isSingle: isSingle,
        );
      },
    );
  }

  @override
  State<OptionCategoryModalBottomSheet> createState() =>
      _OptionCategoryModalBottomSheetState();
}

class _OptionCategoryModalBottomSheetState
    extends State<OptionCategoryModalBottomSheet> {
  List<CategoryHouse> _currentCategories = [];

  @override
  void initState() {
    super.initState();
    _currentCategories = List.of(widget.categories);
  }

  // void _closeAndSelectCtg() {
  //   final isEmpty = checkIfEmpty();
  //   if (isEmpty) {
  //     return;
  //   }
  //   if (Navigator.canPop(context)) {
  //     Navigator.pop(context, _currentCategories);
  //   }
  // }

  bool checkIfEmpty() {
    final isEmpty = _currentCategories.getAllSelected?.isEmpty;

    if (isEmpty ?? true) {
      Helpers.showToastInfo(context, context.translation.bol_say);
    }

    return isEmpty ?? true;
  }

  void _addToSelectedItems(CategoryHouse ctg, int index) {
    _currentCategories = List<CategoryHouse>.from(_currentCategories).update(
      index,
      ctg,
    );

    setState(() {});
  }

  void _addSingle(CategoryHouse ctg, int index) {
    _currentCategories = List<CategoryHouse>.from(_currentCategories)
        .map((c) => c.copyWith(selected: false))
        .toList();
    _addToSelectedItems(ctg, index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12).r,
          topRight: const Radius.circular(12).r,
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: 1.sh * .6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ).w,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.w,
                  color: const Color(0xffDDDDDD),
                ),
              ),
            ),
            child: SizedBox(
              height: 30.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                  Center(
                    child: AppText.s14w400BdM(
                      context.translation.section,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _currentCategories.length,
              itemBuilder: (context, index) {
                final ctg = _currentCategories[index];
                return OptionModalSheetTile(
                  title: ctg.name,
                  isSelected: ctg.selected,
                  onTap: () {
                    final updated = ctg.copyWith(selected: !ctg.selected);
                    if (widget.isSingle) {
                      _addSingle(updated, index);
                      return;
                    }
                    _addToSelectedItems(updated, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
