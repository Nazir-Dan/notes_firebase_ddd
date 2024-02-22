import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:injectable/injectable.dart';

import 'package:notes_firebase_ddd/domain/auth/user.dart';
import 'package:notes_firebase_ddd/domain/core/value_object.dart';

@lazySingleton
class FirebaseUserMapper {
  User? toDomain(fbAuth.User? _) =>
      _ == null ? null : User(id: UniqId.fromUniqString(_.uid));
}
