import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure with _$ValueFailure {
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail;
  const factory ValueFailure.shortPassword({required String failedValue}) =
      ShortPassword;
}
