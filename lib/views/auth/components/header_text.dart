// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';

class HeaderText extends StatelessWidget {
  String name;
  bool isActive;
  Function() function;
  HeaderText({Key? key, required this.name, required this.isActive, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: function,
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isActive ? MainColors.mainPink : textSecondary(context)),
          ),
          if (isActive)
            AnimatedContainer(
              duration: Duration(
                milliseconds: 400,
              ),
              width: size.width * .15,
              height: 3,
              decoration: BoxDecoration(color: mainColor(context), borderRadius: BorderRadius.circular(15)),
            )
        ],
      ),
    );
  }
}
