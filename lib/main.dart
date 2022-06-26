import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/login/presentation/pages/login.dart';
import 'package:test_project/features/note/presentation/bloc/note_bloc.dart';
import 'package:test_project/features/note/presentation/pages/add_note.dart';
import 'package:test_project/features/note/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteBloc>(
        create: (context) => NoteBloc()..add(FetchNotes()),
        child: MaterialApp(
          title: 'Flutter Note App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => LoginPage(),
                );
              case '/home':
                return MaterialPageRoute(
                  builder: (_) => HomePage(),
                );
              case '/addnote':
                return MaterialPageRoute(
                  builder: (_) => AddNotePage(),
                );
              default:
                return null;
            }
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
