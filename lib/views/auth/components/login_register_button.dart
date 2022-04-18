// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/core_shelf.dart';

class LoginRegisterButton extends StatelessWidget {
  void Function()? onPressed;
  bool isLoading;
  LoginRegisterButton({Key? key, this.onPressed, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Align(
      alignment: Alignment.bottomRight,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          margin: EdgeInsets.all(6),
          width: size.width * .28,
          height: 60,
          decoration: BoxDecoration(color: mainColor(context), borderRadius: BorderRadius.circular(16)),
          child: isLoading
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 14,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      authProvider.currentPage.translate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
