import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class MainColors {
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color success = Color(0xFF75D100);
  static const Color warning = Color(0xFFFF4B23);
}

const Color bgPrimaryDark = Color(0xff16151A);
const Color bgSecondaryDark = Color(0xff1F1E25);
const Color textPrimaryDark = Color(0xffFFFFFF);
const Color textSecondaryDark = Color(0xffBDBDBD);

const Color bgPrimaryLight = Color(0xffF6F8FA);
const Color bgSecondaryLight = Color(0xffFFFFFF);
const Color textPrimaryLight = Color(0xff0D1012);
const Color textSecondaryLight = Color(0xFFB6B3B3);

ThemeProvider themeProvider(BuildContext context) => Provider.of<ThemeProvider>(context, listen: false);

/// Primary background color for both of Dark and Light theme
///
/// For Dark : [Color(0xff212332)];
///
/// For Light : [Color(0xffF3F6F9)];
Color bgPrimary(BuildContext context) => themeProvider(context).isDark() ? bgPrimaryDark : bgPrimaryLight;

/// Secondary background color for both of Dark and Light theme
///
/// For Dark : [Color(0xff2A2E3F)];
///
/// For Light : [Color(0xffffffff)];
Color bgSecondary(BuildContext context) => themeProvider(context).isDark() ? bgSecondaryDark : bgSecondaryLight;

/// Primary text color for both of Dark and Light theme
///
/// For Dark : [Color(0xffFFFFFF)];
///
/// For Light : [Color(0xff0D1012)];
Color textPrimary(BuildContext context) => themeProvider(context).isDark() ? textPrimaryDark : textPrimaryLight;

/// Secondary text color for both of Dark and Light theme
///
/// For Dark : [Color(0xff3F4152)];
///
/// For Light : [Color(0xff667685)];
Color textSecondary(BuildContext context) => themeProvider(context).isDark() ? textSecondaryDark : textSecondaryLight;

String toastColor(BuildContext context) => themeProvider(context).isDark() ? '#FF4b23' : '#13074a';
