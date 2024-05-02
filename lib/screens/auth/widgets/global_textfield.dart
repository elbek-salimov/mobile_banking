import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.validate,
    required this.validateText,
    required this.validateEmptyText,
  });

  final String title;
  final String validateText;
  final String validateEmptyText;
  final Widget icon;
  final TextEditingController controller;
  final RegExp validate;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return TextFormField(
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return validateEmptyText;
        }
        if (!validate.hasMatch(value) || value.length < 3) {
          return validateText;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.only(top: 7.h, bottom: 7.h),
        prefixIcon: icon,
        hintText: title,
      ),
    );
  }
}
