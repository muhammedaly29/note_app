import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Widgets/colors_list_view.dart';
import 'package:note_app/constant.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;

              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: ColorItem(
                color: kColors[index],
                isActivate: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
