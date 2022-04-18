import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/auth/auth_view.dart';
import 'package:piton_shop_list/views/products/productlist/product_list.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateUser() {
    Future.delayed(Duration(seconds: 2), () async {
      final isUserLogged = await localManager.getBoolValue(LocalManagerKeys.isUserLogged);

      navigatonService.navigateToPageClear(isUserLogged ? ProductList() : AuthView());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    navigateUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .8,
              height: 200,
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            Text(
              'redirecting'.translate,
              style: TextStyle(
                color: textPrimary(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
