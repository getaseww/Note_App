import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/features/note/data/models/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteLoading()) {
    on<FetchNotes>(_onFetchNotes);
    on<AddNote>(_onAddNote);
    on<MarkNote>(_onMarkNote);
    on<RemoveNote>(_onRemoveNote);
  }
  void _onFetchNotes(FetchNotes event, Emitter<NoteState> emit) {
    emit(NoteLoaded(notes: event.notes));
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) {
    final state = this.state;
    if (state is NoteLoaded) {
      emit(NoteLoaded(notes: List.from(state.notes)..add(event.note)));
    }
  }

  void _onMarkNote(MarkNote event, Emitter<NoteState> emit) {
    final state = this.state;
    if (state is NoteLoaded) {
      List<NoteModel> notes = state.notes;
      NoteModel note = notes[event.index];
      note.status = Status.done;
      notes[event.index] = note;
      emit(NoteLoaded(notes: notes));
    }
  }

  void _onRemoveNote(RemoveNote event, Emitter<NoteState> emit) {
    final state = this.state;
    if (state is NoteLoaded) {
      List<NoteModel> notes = state.notes..removeAt(event.index);
      emit(NoteLoaded(notes: notes));
    }
  }
}
