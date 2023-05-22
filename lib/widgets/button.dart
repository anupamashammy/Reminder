import 'package:flutter/material.dart';
import 'package:reminder_application8078/colors/colors.dart';

class MyButton extends StatelessWidget {
   final String label;
  

  const MyButton({super.key,required this.label, required Function() onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr
        ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,

          ),
        ),
      ),

      );
  }
}