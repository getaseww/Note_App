import 'package:equatable/equatable.dart';

enum Status { done, active }

class NoteModel extends Equatable {
  final String title;
  final String body;
  late Status status;
  NoteModel({
    required this.title,
    required this.body,
    required this.status,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
        title: json['title'], body: json['body'], status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'status': status,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, body, status];
}
