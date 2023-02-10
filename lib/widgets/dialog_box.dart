import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.purple[400],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Task Name",
                hintStyle: GoogleFonts.roboto(color: Colors.grey[200]),
                border: const OutlineInputBorder(),
              ),
              style: GoogleFonts.roboto(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Add Taks',
                  onClick: onSave,
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                CustomButton(
                  text: 'Cancel',
                  onClick: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
