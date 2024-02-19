import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';
import 'package:notes_firebase_ddd/domain/core/value_object.dart';

import '../core/value_validarors.dart';

class EmailAddress extends ValueObject {
  @override
  final Either<ValueFailure, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({required this.value});
}

class Password extends ValueObject {
  @override
  final Either<ValueFailure, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(value: validatePassword(input));
  }

  const Password._({required this.value});
}
