import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:notes_firebase_ddd/domain/core/errors.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';
import 'package:notes_firebase_ddd/domain/core/value_validarors.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure, T> get value;

  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool operator ==(covariant other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqId extends ValueObject {
  @override
  final Either<ValueFailure, String> value;
  factory UniqId() {
    return UniqId._(
      value: right(Uuid().v4()),
    );
  }
  factory UniqId.fromUniqString(String uniqId) {
    assert(uniqId != null);
    return UniqId._(
      value: right(uniqId),
    );
  }
  const UniqId._({required this.value});
}

class StringSingleLine extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringSingleLine(String input) {
    assert(input != null);
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}
