import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/add_note/add_note_cubit.dart';
import 'package:note_app/constant.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActivate, required this.color});
  final bool isActivate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActivate
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 35,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
 
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
              BlocProvider.of<AddNoteCubit>(context).color= kColors[index];

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
