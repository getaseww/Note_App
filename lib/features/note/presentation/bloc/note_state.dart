part of 'note_bloc.dart';

@immutable
abstract class NoteState {}

class NoteLoading extends NoteState {}

// ignore: must_be_immutable
class NoteError extends NoteState {
  late String errorMessage;

  NoteError({
    required this.errorMessage,
  });

  List<Object?> get props => [];
}

// ignore: must_be_immutable
class NoteLoaded extends NoteState {
  final List<NoteModel> notes;

  NoteLoaded({
    this.notes = const <NoteModel>[],
  });

  List<Object?> get props => [notes];
}
