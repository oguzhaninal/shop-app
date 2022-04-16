// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  final AuthProvider? auth;
  const LoginScreen({Key? key, this.auth}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .01,
      ),
      child: Column(
        children: [
          MyTextField(
            icon: Icons.mail_outline,
            hintText: "mail".translate,
            isPassword: false,
            isEmail: true,
            isPhone: false,
          ),
          MyTextField(
            icon: FontAwesome5.lock,
            hintText: "password".translate,
            isPassword: true,
            isEmail: false,
            isPhone: false,
          ),
          Row(
            children: [
              Checkbox(
                  side: BorderSide(color: textPrimary(context)),
                  checkColor: textSecondary(context),
                  activeColor: mainColor(context),
                  value: widget.auth!.rememberMe,
                  onChanged: (value) {
                    widget.auth!.setRememberMe(value!);
                  }),
              GestureDetector(
                onTap: () {
                  widget.auth!.setRememberMe(!widget.auth!.rememberMe);
                },
                child: Text(
                  "remember_me".translate,
                  style: TextStyle(fontSize: 14, color: textPrimary(context)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
