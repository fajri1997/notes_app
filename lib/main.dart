import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/pages/note_page.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(

//     ChangeNotifierProvider(
//       create: (context) => NoteProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: _router.routeInformationParser,
//       routerDelegate: _router.routerDelegate,
//     );
//   }

//   final _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         name: "home",
//         builder: (context, state) => HomePage(),
//       ),
//       GoRoute(
//         path: '/note',
//         name: "note",
//         builder: (context, state) {
//           return NotePage(note: state.extra as Note);
//         },
//       ),
//       // GoRoute(
//       //   path: '/note/:noteid',
//       //   builder: (context, state) {
//       //     final id = int.parse(state.params["noteid"] ?? "");
//       //     final note =
//       //         Provider.of<NoteProvider>(context, listen: false).getNote(id: id);
//       //     return NotePage(note: state.extra as Note);
//       //   },
//       // ),
//     ],
//   );
// }

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NoteProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) {
          final notesProvider =
              Provider.of<NoteProvider>(context, listen: false);
          return NotePage(
              note: Note(
                  id: -1, title: '', body: '')); // Create a new Note object
        },
      ),
    ],
  );
}
