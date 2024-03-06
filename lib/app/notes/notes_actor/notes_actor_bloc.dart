import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:notes_firebase_ddd/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/domain/notes/note_failure.dart';

part 'notes_actor_event.dart';
part 'notes_actor_state.dart';

part 'notes_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const Initial()) {
    on<_Deleted>((event, emit) async {
      // We have only one NoteActorEvent - there's no union type
      emit(const NoteActorState.actionInProgress());
      final possibleFailure = await _noteRepository.delete(event.note);
      emit(
        possibleFailure.fold(
          (f) => NoteActorState.deleteFailure(f),
          // Yielding unchanged state - nothing will be emitted from the BLoC
          (_) => const NoteActorState.deleteSuccess(),
        ),
      );
    });
  }
}
