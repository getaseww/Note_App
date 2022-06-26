import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/note/data/models/note_model.dart';
import 'package:test_project/features/note/presentation/bloc/note_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _body;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> addNoteScreenKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: addNoteScreenKey,
      appBar: AppBar(
        title: const Center(
          child: Text("Add Note"),
        ),
      ),
      body: BlocListener<NoteBloc, NoteState>(
        listener: (context, state) {
          if (state is NoteLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Note added successfully')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        onSaved: (value) => _title = value.toString(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title!';
                          }
                          return null;
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Body',
                        ),
                        onSaved: (value) => _body = value.toString(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title!';
                          }
                          return null;
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var note = NoteModel(
                          title: _title,
                          body: _body,
                          status: Status.active,
                        );
                        context.read<NoteBloc>().add(AddNote(note: note));
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/home', (route) => false);
                      }
                    },
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 50, 50)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
