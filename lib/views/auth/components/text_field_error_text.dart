// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class TextFieldError extends StatelessWidget {
  String content;
  TextFieldError({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        style: TextStyle(
          color: MainColors.warning,
          fontSize: 10,
        ),
      ),
    );
  }
}
