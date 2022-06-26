import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/note/data/models/note_model.dart';
import 'package:test_project/features/note/presentation/bloc/note_bloc.dart';

class CustomeCard extends StatelessWidget {
  final NoteModel note;
  final int index;
  const CustomeCard({Key? key, required this.note, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state is NoteLoaded) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            note.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            note.body,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: note.status == Status.active
                            ? () {
                                context
                                    .read<NoteBloc>()
                                    .add(MarkNote(index: index));
                              }
                            : null,
                        child: note.status == Status.active
                            ? const Text("Mark Done")
                            : const Text("Done"))
                  ]),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
