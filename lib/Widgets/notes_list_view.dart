import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes/notes_cubit.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
