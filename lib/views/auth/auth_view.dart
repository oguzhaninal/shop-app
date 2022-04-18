// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/auth/components/header_text.dart';
import 'package:piton_shop_list/views/auth/login/login_view.dart';
import 'package:piton_shop_list/views/auth/register/register_view.dart';
import 'package:piton_shop_list/views/settings/settings_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final themNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    AppLocalizations.of(context);

    return Consumer(builder: (context, LanguageProvider lang, child) {
      return SafeArea(
        child: Scaffold(
          // backgroundColor: bgPrimary(context),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.height * .35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(themNotifier.isDark()
                            ? "assets/images/login_header_dark.jpg"
                            : "assets/images/login_header.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                // curve: Curves.bounceOut,
                top: size.height * .22,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  // curve: Curves.bounceOut,
                  padding: EdgeInsets.all(20),
                  height: authProvider.currentPage == 'register' ? size.height * .59 : size.height * .44,
                  width: size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: bgSecondary(context),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 15, spreadRadius: 5),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HeaderText(
                              name: 'login'.translate,
                              isActive: authProvider.currentPage == 'login',
                              function: () {
                                authProvider.setCurrenPage('login');
                              },
                            ),
                            HeaderText(
                                name: 'register'.translate,
                                isActive: authProvider.currentPage == 'register',
                                function: () {
                                  authProvider.setCurrenPage('register');
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        authProvider.currentPage == 'login'
                            ? LoginScreen(
                                auth: authProvider,
                              )
                            : RegisterScreen(
                                auth: authProvider,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: InkWell(
                  onTap: () {
                    navigatonService.navigateTo(Settings());
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: textSecondary(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
