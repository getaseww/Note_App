part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {
  const NoteEvent();
}

class FetchNotes extends NoteEvent {
  final List<NoteModel> notes;

  FetchNotes({this.notes = const <NoteModel>[]});

  @override
  List<Object?> get props => [notes];
}

class AddNote extends NoteEvent {
  final NoteModel note;
  const AddNote({required this.note});

  @override
  List<Object?> get props => [note];
}

class MarkNote extends NoteEvent {
  final int index;
  const MarkNote({required this.index});

  @override
  List<Object?> get props => [index];
}

class RemoveNote extends NoteEvent {
  final int index;
  const RemoveNote({required this.index});

  @override
  List<Object?> get props => [index];
}
