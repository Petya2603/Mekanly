import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../product/base/base_global_data.dart';
import '../../../product/base/base_status/base_status.dart';
import '../../../product/base/bloc/base_bloc.dart';
import '../../../remote/entities/global_options/global_option_values.dart';
import '../../../remote/entities/global_options/global_options.dart';
import '../../../remote/entities/houses/house_entity.dart';
import '../../../remote/repositories/houses/house_repository.dart';

part 'houses_event.dart';
part 'houses_state.dart';
part 'houses_bloc.freezed.dart';

@injectable
class HousesBloc extends BaseBloc<HousesEvent, HousesState> {
  HousesBloc(this._housesRepository) : super(const HousesState()) {
    on<_Refresh>(_onRefresh);
    on<_GetFilters>(_onGetFilters);
    on<_Filter>(_onApplyFilter);
  }

  final HousesRepository _housesRepository;

  FutureOr<void> _onRefresh(
    _Refresh event,
    Emitter<HousesState> emit,
  ) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final result = await _housesRepository.houses();

    result.fold(
      (l) => emit(state.copyWith(status: BaseStatus.failure(l))),
      (r) async {
        final houses = r.houses;
        final filter = state.globalOptions?.data;
        final globalFilter = BaseGlobalData.instance.filter;
        if (globalFilter == null && filter == null) {
          add(HousesEvent.getFilter(houses));
          return;
        }
        if (filter != null || globalFilter != null) {
          final currentFilter = filter ?? globalFilter!;

          final updated = currentFilter.copyWith(
            floorCount: GlobalOptionValues.floorCounts,
            roomCount: GlobalOptionValues.roomCounts,
            floorCountHouse: GlobalOptionValues.floorCountsHouse,
            roomCountHouse: GlobalOptionValues.roomCountsHouse,
            levelCountHouse: GlobalOptionValues.levelCountsHouse,
          );
          final data = GlobalOptionsResponse(data: updated);
          BaseGlobalData.instance.filter = data.data;

          return emit(
            state.copyWith(
              status: const BaseStatus.success(),
              houses: houses,
              globalOptions: data,
            ),
          );
        }
        return emit(
          state.copyWith(
            status: const BaseStatus.success(),
            houses: houses,
          ),
        );
      },
    );
  }

  FutureOr<void> _onGetFilters(
    _GetFilters event,
    Emitter<HousesState> emit,
  ) async {
    final res = await _housesRepository.globalOptions();
    res.fold(
      (l) => emit(state.copyWith(status: BaseStatus.failure(l))),
      (r) {
        final filter = r.data.copyWith(
          floorCount: GlobalOptionValues.floorCounts,
          roomCount: GlobalOptionValues.roomCounts,
          floorCountHouse: GlobalOptionValues.floorCountsHouse,
          roomCountHouse: GlobalOptionValues.roomCountsHouse,
          levelCountHouse: GlobalOptionValues.levelCountsHouse,
        );
        BaseGlobalData.instance.filter = filter;
        final updated = r.copyWith(data: filter);
        return emit(
          state.copyWith(
            status: const BaseStatus.success(),
            globalOptions: updated,
            houses: event.houses,
          ),
        );
      },
    );
  }

  FutureOr<void> _onApplyFilter(
    _Filter event,
    Emitter<HousesState> emit,
  ) async {
    final filter = state.globalOptions?.copyWith(
      data: event.filter,
    );
    emit(
      state.copyWith(
        status: const BaseStatus.loading(),
        globalOptions: filter,
      ),
    );

    final res = await _housesRepository.filter(filter: event.filter);
    res.fold(
      (l) => emit(state.copyWith(status: BaseStatus.failure(l))),
      (r) {
        return emit(
          state.copyWith(
            status: const BaseStatus.success(),
            globalOptions: filter,
            houses: r,
          ),
        );
      },
    );
  }
}
