// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/views/auth/components/login_register_button.dart';
import 'package:piton_shop_list/views/auth/components/text_field_error_text.dart';
import '../../../core/core_shelf.dart';
import '../components/text_field.dart';

class RegisterScreen extends StatefulWidget {
  final AuthProvider? auth;

  const RegisterScreen({Key? key, this.auth}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passController2 = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
            icon: FontAwesome.user,
            hintText: "name".translate,
            isPassword: false,
            isEmail: false,
            isPhone: false,
            textEditingController: nameController,
            onChanged: (v) {
              authProvider.setNameStatus(v);
            },
          ),
          if (authProvider.isNameEmpty) TextFieldError(content: 'name_error'.translate),
          MyTextField(
            icon: FontAwesome5.phone,
            hintText: "phone".translate,
            isPassword: false,
            isEmail: false,
            isPhone: true,
            textEditingController: phoneController,
            onChanged: (v) {
              authProvider.setPhoneValidate(v.length);
            },
          ),
          if (!authProvider.isPhoneTrue) TextFieldError(content: 'phone_error'.translate),
          MyTextField(
            icon: Icons.mail_outline,
            hintText: "mail".translate,
            isPassword: false,
            isEmail: true,
            isPhone: false,
            textEditingController: mailController,
            onChanged: (v) {
              authProvider.emailValidate(v, false);
            },
          ),
          if (!authProvider.isEmail) TextFieldError(content: 'mail_error'.translate),
          MyTextField(
            icon: FontAwesome5.lock,
            hintText: "password".translate,
            isPassword: true,
            isEmail: false,
            isPhone: false,
            textEditingController: passController,
            onChanged: (v) {
              authProvider.passValid(v);
              // authProvider.setPass1(v);
            },
          ),
          if (!authProvider.isPassValidated) TextFieldError(content: 'pass_validate_error'.translate),
          MyTextField(
            icon: FontAwesome5.lock,
            hintText: "pass_validate".translate,
            isPassword: true,
            isEmail: false,
            isPhone: false,
            textEditingController: passController2,
            onChanged: (v) {
              authProvider.checkPassIsSame(v, passController.text);
            },
          ),
          if (!authProvider.isPassesSame) TextFieldError(content: 'pass_same_error'.translate),
          LoginRegisterButton(
            isLoading: isLoading,
            onPressed: () async {
              await authProvider.setPhoneValidate(phoneController.text.length);
              authProvider.setNameStatus(nameController.text);
              authProvider.emailValidate(mailController.text, false);
              if (!authProvider.isNameEmpty &&
                  authProvider.isPassValidated &&
                  authProvider.isPassesSame &&
                  authProvider.isPhoneTrue &&
                  authProvider.isEmail) {
                setState(() {
                  isLoading = true;
                });
                authService
                    .registerUser(
                        nameSurname: nameController.text, mail: mailController.text, password: passController.text)
                    .whenComplete(() {
                  setState(() {
                    isLoading = false;
                  });
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
