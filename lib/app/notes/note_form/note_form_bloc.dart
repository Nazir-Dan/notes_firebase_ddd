import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/domain/notes/note_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd/domain/notes/notes_value_objects.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<_Initialized>((event, emit) {
      emit(event.initialNoteOption.fold(
        // Yielding an unchanged state results in not emitting anything at all
        () => state,
        (initialNote) {
          return state.copyWith(
            note: initialNote,
            isEditing: true,
          );
        },
      ));
    });
    on<_BodyChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(body: NoteBody(event.bodyStr)),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_ColorChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(color: NoteColor(event.color)),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_TodosChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(
          todos: List3(
            event.todos.map((primitive) => primitive.toDomain()),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_Saved>(
      (event, emit) async {
        Either<NoteFailure, Unit>? failureOrSuccess;

        emit(state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        ));

        if (state.note.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.update(state.note)
              : await _noteRepository.create(state.note);
        }
        emit(state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      },
    );
  }
}
