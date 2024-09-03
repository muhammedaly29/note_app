import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes/notes_cubit.dart';
import 'package:note_app/Widgets/custom_app_bar.dart';

import 'package:note_app/Widgets/notes_list_view.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        CustomAppBar(
          title: 'Notes',
          icon: Icons.search,
        ),
        Expanded(
          child: NotesListView(),
        ),
      ]),
    );
  }
}
