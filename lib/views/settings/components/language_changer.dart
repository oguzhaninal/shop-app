import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class UserSettingsLanguageChanger extends StatelessWidget {
  const UserSettingsLanguageChanger({
    Key? key,
    required this.langProvider,
  }) : super(key: key);

  final LanguageProvider langProvider;

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: bgPrimary(context),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: border(context),
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
              'change_language'.translate,
              style: TextStyle(
                color: textPrimary(context),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            Container(
              width: 180,
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        await langProvider.changeLanguage('en');
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'En',
                            style: TextStyle(
                              color: langProvider.appLocal == Locale('en') || langProvider.appLocal == null
                                  ? Colors.white
                                  : textSecondary(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: langProvider.appLocal == Locale('en') || langProvider.appLocal == null
                              ? mainColor(context)
                              : bgSecondary(context),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(4),
                          ),
                          border: Border.all(
                            color: border(context),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 30,
                    color: border(context),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        await langProvider.changeLanguage('tr');
                        print(langProvider.appLocal == Locale('tr'));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Tr',
                            style: TextStyle(
                              color: langProvider.appLocal == Locale('tr') ? Colors.white : textSecondary(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: langProvider.appLocal == Locale('tr') ? mainColor(context) : bgSecondary(context),
                          border: Border.all(
                            color: border(context),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 30,
                    color: border(context),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: bgSecondary(context),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: border(context),
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
