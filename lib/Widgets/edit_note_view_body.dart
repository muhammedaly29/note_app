import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes/notes_cubit.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Widgets/custom_app_bar.dart';
import 'package:note_app/Widgets/custom_text_field.dart';
import 'package:note_app/Widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subtitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              subtitle = value;
            },
            hintText: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 15,
          ),
          EditNoteColorsList(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
