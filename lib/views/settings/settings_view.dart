// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/settings/components/language_changer.dart';
import 'package:piton_shop_list/views/settings/components/logout_button.dart';
import 'package:piton_shop_list/views/settings/components/theme_changer.dart';

import '../../core/core_shelf.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final themeNotifier = Provider.of<ThemeProvider>(context, listen: false);
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'settings'.translate,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: mainColor(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .02,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                UserSettingsThemeChanger(themeNotifier: themeNotifier),
                SizedBox(
                  height: 10,
                ),
                UserSettingsLanguageChanger(langProvider: langProvider),
                SizedBox(
                  height: 10,
                ),
                UserSettingsLogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
