import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../remote/response_error.dart';


part 'base_status.freezed.dart';

@freezed
class BaseStatus<T> with _$BaseStatus<T> {
  const factory BaseStatus.initial() = Initial<T>;

  const factory BaseStatus.loading() = Loading<T>;

  const factory BaseStatus.lazyLoading() = LazyLoading<T>;

  const factory BaseStatus.success() = Success<T>;

  const factory BaseStatus.valid() = Valid<T>;

  const factory BaseStatus.invalid() = Invalid<T>;

  const factory BaseStatus.failure(ResponseError<T> error) = Failure<T>;
}

extension BaseStatusExtension<T> on BaseStatus<T> {
  bool get isInitial => this is Initial<T>;

  bool get isLoading => this is Loading<T>;

  bool get isLazyLoading => this is LazyLoading<T>;

  bool get isSuccess => this is Success<T>;

  bool get isValid => this is Valid<T>;

  bool get isInvalid => this is Invalid<T>;

  bool get isFailure => this is Failure<T>;
}
