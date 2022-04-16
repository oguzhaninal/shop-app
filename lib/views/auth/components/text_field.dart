// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class MyTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final TextEditingController? textEditingController;
  MyTextField({
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.isPhone,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final themNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        // controller: textEditingController,
        obscureText: isPassword,
        style: TextStyle(color: textPrimary(context)),
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isPhone
                ? TextInputType.phone
                : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: mainColor(context),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: textSecondary(context)),
        ),
      ),
    );
  }
}
