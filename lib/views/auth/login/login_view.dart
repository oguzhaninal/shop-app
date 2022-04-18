// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/auth/components/login_register_button.dart';
import '../components/text_field.dart';
import '../components/text_field_error_text.dart';

class LoginScreen extends StatefulWidget {
  final AuthProvider? auth;
  const LoginScreen({Key? key, this.auth}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    AppLocalizations.of(context);

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
            textEditingController: mailController,
            onChanged: (v) {
              authProvider.emailValidate(v, true);
            },
          ),
          if (!authProvider.isEmailLogin) TextFieldError(content: 'mail_error'.translate),
          MyTextField(
            icon: FontAwesome5.lock,
            hintText: "password".translate,
            isPassword: true,
            isEmail: false,
            isPhone: false,
            textEditingController: passController,
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
          LoginRegisterButton(
            isLoading: isLoading,
            onPressed: () async {
              authProvider.emailValidate(mailController.text, true);
              if (mailController.text.isNotEmpty || passController.text.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });
                authService
                    .loginUser(
                        email: mailController.text, password: passController.text, rememberMe: widget.auth!.rememberMe)
                    .whenComplete(() {
                  setState(() {});
                  isLoading = false;
                });
              } else if (mailController.text.isEmpty || passController.text.isEmpty) {
                authService.toastMessage(message: 'mail_pass_empty'.translate, color: MainColors.warning);
              }
            },
          ),
        ],
      ),
    );
  }
}
