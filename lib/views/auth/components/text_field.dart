// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/core_shelf.dart';

class MyTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final TextEditingController? textEditingController;
  Function(String)? onChanged;
  MyTextField({
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.isPhone,
    this.textEditingController,
    this.onChanged,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obsText = true;
  var maskFormatter = MaskTextInputFormatter(
      mask: '+90 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
  @override
  Widget build(BuildContext context) {
    final themNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: mainColor(context)),
        child: TextFormField(
          controller: widget.textEditingController,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.isPhone ? [maskFormatter] : null,
          obscureText: widget.isPassword && obsText,
          style: TextStyle(color: textPrimary(context)),
          keyboardType: widget.isEmail
              ? TextInputType.emailAddress
              : widget.isPhone
                  ? TextInputType.phone
                  : TextInputType.text,
          decoration: InputDecoration(
            suffixIconColor: mainColor(context),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obsText = !obsText;
                      });
                    },
                    icon: Icon(
                      obsText ? FontAwesome5.eye_slash : FontAwesome5.eye,
                      color: mainColor(context),
                    ))
                : null,
            prefixIcon: Icon(
              widget.icon,
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
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MainColors.warning,
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
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 14, color: textSecondary(context)),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
