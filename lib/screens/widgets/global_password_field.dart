import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

class GlobalPasswordField extends StatefulWidget {
  const GlobalPasswordField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.validate,
    required this.formKey,
  });

  final String title;
  final Widget icon;
  final TextEditingController controller;
  final RegExp validate;
  final GlobalKey formKey;

  @override
  State<GlobalPasswordField> createState() => _GlobalPasswordFieldState();
}

class _GlobalPasswordFieldState extends State<GlobalPasswordField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter password';
          }
          if (!widget.validate.hasMatch(value)) {
            return 'Incorrect password';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        obscureText: isVisible,
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
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.only(top: 7.h, bottom: 7.h),
          prefixIcon: widget.icon,
          suffixIcon: Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
                child: isVisible
                    ? const Icon(Icons.remove_red_eye, color: Colors.green)
                    : const Icon(Icons.visibility_off, color: Colors.green),
              ),
            ),
          ),
          hintText: widget.title,
        ),
      ),
    );
  }
}
