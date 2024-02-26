import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';
import 'package:notes_firebase_ddd/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/domain/notes/note_failure.dart';

part 'notes_watcher_event.dart';
part 'notes_watcher_state.dart';

part 'notes_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;
  late StreamSubscription<Either<NoteFailure, KtList<Note>>> _noteStreamSubscription;

  NoteWatcherBloc(this._noteRepository) : super(const Initial()) {
    on<_WatchAllStarted>((event, emit) async {
      emit(const NoteWatcherState.loadInProgress());
      await _noteStreamSubscription?.cancel();
      _noteStreamSubscription = _noteRepository
          .watchAll()
          .listen((notes) => add(NoteWatcherEvent.notesReceived(notes)));
    });
    on<_WatchUncompletedStarted>((event, emit) async {
      emit(const NoteWatcherState.loadInProgress());
      await _noteStreamSubscription?.cancel();
      _noteStreamSubscription = _noteRepository
          .watchUncompleted()
          .listen((notes) => add(NoteWatcherEvent.notesReceived(notes)));
    });
    on<_NotesReceived>((event, emit) {
      emit(
        event.failureOrNotes.fold(
          (f) => NoteWatcherState.loadFailure(f),
          (notes) => NoteWatcherState.loadSuccess(notes),
        ),
      );
    });
  }


  @override
  NoteWatcherState get initialState => const NoteWatcherState.initial();

  @override
  Future<void> close() async {
    await _noteStreamSubscription.cancel();
    return super.close();
  }
}
