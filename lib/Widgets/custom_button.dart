import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 25,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
