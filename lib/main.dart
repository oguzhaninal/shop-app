import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/locator.dart';
import 'core/core_shelf.dart' as core;

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await core.LocalManager.prefrencesInit();
  final languageProvider = core.LanguageProvider();
  await languageProvider.fetchLocale();
  final themeProvider = core.ThemeProvider.instance;
  await themeProvider.fetchLocale();
  runApp(core.MultiProvider(
    providers: [...?core.ApplicationProvider.instance?.dependItems],
    child: MyApp(
      languageProvider: languageProvider,
      themeProvider: themeProvider,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final core.LanguageProvider languageProvider;
  final core.ThemeProvider themeProvider;
  const MyApp({required this.languageProvider, required this.themeProvider, Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: core.Consumer2<core.LanguageProvider, core.ThemeProvider>(
        builder: (context, langModel, themeModel, child) => MaterialApp(
          title: 'Piton Shop List',
          debugShowCheckedModeBanner: false,
          theme: widget.themeProvider.theme,
          localizationsDelegates: [...core.AppLocalizations.localDelegates],
          locale: langModel.appLocal ?? widget.languageProvider.appLocal,
          supportedLocales: [...core.AppLocalizations.locales],
          onGenerateRoute: core.NavigationRoute.instance.generateRoute,
          navigatorKey: core.NavigationService.instance.navigatorKey,
        ),
      ),
    );
  }
}
