import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final TextInputType kType;
  final Function(String)? onChanged;
  final Color hintColor;
  final TextEditingController? controller;
  final int maxLines;

  CustomTextField(
      {Key? key,
      required this.hintText,
      this.initialValue,
      this.maxLines = 1,
      this.kType = TextInputType.text,
      this.onChanged,
      this.controller,
      this.hintColor = Colors.grey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onChanged: onChanged,
      initialValue: null,
      keyboardType: kType,
      controller: controller,
      cursorHeight: 20,
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
        // fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: GoogleFonts.quicksand()),
    );
  }
}
