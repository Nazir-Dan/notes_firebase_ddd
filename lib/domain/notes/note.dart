import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd/domain/core/entity.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';
import 'package:notes_firebase_ddd/domain/core/value_object.dart';
import 'package:notes_firebase_ddd/domain/notes/notes_value_objects.dart';
import 'package:notes_firebase_ddd/domain/notes/todo_item.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note implements IEntity {
  const factory Note({
    required UniqId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: List3(emptyList()),
      );
}

extension NoteX on Note {
  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(color.failureOrUnit)
        .andThen(todos.failureOrUnit)
        .andThen(
          todos
              .getOrCrash()
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
