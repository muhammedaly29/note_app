import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Cubits/notes/notes_cubit.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(note.color)),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 35),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 20),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 14),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

