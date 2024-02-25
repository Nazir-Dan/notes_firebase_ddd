import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/core/entity.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';
import 'package:notes_firebase_ddd/domain/core/value_object.dart';
import 'package:notes_firebase_ddd/domain/notes/notes_value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem implements IEntity {
  const factory TodoItem({
    required UniqId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqId(),
        name: TodoName(''),
        done: false,
      );
}

extension TodoItemX on TodoItem {
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold((f) => some(f), (_) => none());
  }
}
