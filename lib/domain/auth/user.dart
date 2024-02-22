import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/core/value_object.dart';

part 'user.freezed.dart';

@immutable
@freezed
abstract class User with _$User {
  const factory User({required UniqId id}) = _User;
}