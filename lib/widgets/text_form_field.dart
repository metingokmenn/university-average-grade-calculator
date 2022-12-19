import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final Function onTypingEnd;
  const CustomTextFormField({required this.onTypingEnd, super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String typedCourseName = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      onSaved: ((newValue) {
        setState(() {
          typedCourseName = newValue!;
          widget.onTypingEnd(typedCourseName);
        });
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter the course name';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          filled: true,
          hintText: 'Probability and Statistics',
          fillColor: AppConstants.appPrimaryColor,
          border:
              OutlineInputBorder(borderRadius: AppConstants.appBorderRadius)),
    );
  }
}
