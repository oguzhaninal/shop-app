import 'package:flutter/material.dart';
import 'package:piton_shop_list/views/auth/auth_view.dart';

import '../../../core/core_shelf.dart';

class UserSettingsLogoutButton extends StatelessWidget {
  const UserSettingsLogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 6,
        right: 6,
        bottom: 6,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(3),
        color: Color(0xffff0035).withOpacity(0.2),
        child: InkWell(
          onTap: () async {
            localManager.clearAll();
            navigatonService.navigateToPageClear(AuthView());
          },
          borderRadius: BorderRadius.circular(3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: border(context),
                width: 0.5,
              ),
            ),
            height: 65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24),
                  Text(
                    'logout'.translate,
                    style: TextStyle(
                      color: textPrimary(context),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 24,
                      height: 24,
                      color: Color(0xffff0035),
                      child: Center(
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
