import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class UserSettingsThemeChanger extends StatelessWidget {
  const UserSettingsThemeChanger({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  final ThemeProvider themeNotifier;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context, listen: false);
    AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: bgPrimary(context),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: textSecondary(context),
          width: 0.5,
        ),
      ),
      height: 65,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'change_theme'.translate,
              style: TextStyle(
                color: textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Container(
              width: 60,
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        themeNotifier.theme = getLightTheme();
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.light_mode,
                            color: themeNotifier.theme == getLightTheme() ? Colors.amber : textSecondary(context),
                            size: 16,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: themeNotifier.theme == getLightTheme() ? mainLight : bgSecondary(context),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(4),
                          ),
                          border: Border.all(
                            color: textSecondary(context),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 30,
                    color: textSecondary(context),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        themeNotifier.theme = getDarkTheme();
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.dark_mode,
                            color: themeNotifier.theme == getDarkTheme() ? Colors.amber : textSecondary(context),
                            size: 16,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: themeNotifier.theme == getDarkTheme() ? MainColors.mainPink : bgSecondary(context),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(4),
                          ),
                          border: Border.all(
                            color: textSecondary(context),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: bgSecondary(context),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: textSecondary(context),
                  width: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
