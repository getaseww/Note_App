import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/note/presentation/bloc/note_bloc.dart';
import 'package:test_project/features/note/presentation/widgets/card.dart';
import 'package:test_project/features/note/presentation/widgets/error_widget.dart';
import 'package:test_project/features/note/presentation/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        title: const Center(child: Text("Note App")),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
        if (state is NoteLoading) {
          return LoadingWidget(
            key: UniqueKey(),
          );
        } else if (state is NoteLoaded) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Dismissible(
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      context.read<NoteBloc>().add(RemoveNote(index: index));
                    }
                  },
                  key: UniqueKey(),
                  child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 20,
                      child: CustomeCard(
                        key: UniqueKey(),
                        note: state.notes[index],
                        index: index,
                      )),
                ),
              );
            },
          );
        } else {
          return FailurWidget(key: UniqueKey());
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addnote');
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
