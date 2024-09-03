import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes/notes_cubit.dart';
import 'package:note_app/Widgets/add_note_bottom_sheet.dart';
import 'package:note_app/Widgets/note_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff56E8D2),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: const NoteViewBody(),
      ),
    );
  }
}
