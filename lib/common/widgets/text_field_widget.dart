import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.hint,
      this.type,
      required this.controller,
      this.onChange});
  final String? hint;
  final TextInputType? type;
  final TextEditingController controller;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
      ),
      child: TextField(
        keyboardType: type,
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(size.width * 0.03),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
            ),
            hintText: hint),
      ),
    );
  }
}
