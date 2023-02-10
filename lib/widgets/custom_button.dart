import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onClick});
  final String text;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Theme.of(context).primaryColor,
        onPressed: onClick,
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 13,
          ),
        ));
  }
}
