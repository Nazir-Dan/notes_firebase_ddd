import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd/app/notes/notes_watcher/notes_watcher_bloc.dart';
import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/presentation/notes/notes_overview/widgets/critical_failure_dispaly_widget.dart';
import 'package:notes_firebase_ddd/presentation/notes/notes_overview/widgets/error_note_card_widget.dart';
import 'package:notes_firebase_ddd/presentation/notes/notes_overview/widgets/note_card_widget.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureOption.isSome()) {
                  return ErrorNoteCard(note: note);
                }
                return NoteCard(note: note);
              },
              itemCount: state.notes.size,
            );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(
              failure: state.noteFailure,
            );
          },
        );
      },
    );
  }
}
