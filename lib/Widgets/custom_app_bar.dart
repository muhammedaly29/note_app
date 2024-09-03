import 'package:flutter/material.dart';
import 'package:note_app/Widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        )
      ],
    );
  }
}
