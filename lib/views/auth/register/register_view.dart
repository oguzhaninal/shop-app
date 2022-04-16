import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';
import '../components/text_field.dart';

class RegisterScreen extends StatefulWidget {
  final AuthProvider? auth;

  const RegisterScreen({Key? key, this.auth}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            icon: FontAwesome.user,
            hintText: "name".translate,
            isPassword: false,
            isEmail: false,
            isPhone: false,
          ),
          MyTextField(
            icon: FontAwesome.user,
            hintText: "surname".translate,
            isPassword: false,
            isEmail: false,
            isPhone: false,
          ),
          MyTextField(
            icon: FontAwesome5.phone,
            hintText: "phone".translate,
            isPassword: false,
            isEmail: false,
            isPhone: true,
          ),
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
          MyTextField(
              icon: FontAwesome5.lock,
              hintText: "pass_validate".translate,
              isPassword: true,
              isEmail: false,
              isPhone: false),
        ],
      ),
    );
  }
}
