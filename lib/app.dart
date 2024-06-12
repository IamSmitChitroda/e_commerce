import 'package:e_commerce/headers.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<PlatformController>(context).isAndroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              colorSchemeSeed: const Color(0xff33302e),
            ),
            initialRoute: Provider.of<LoginController>(context).isFirstTime
                ? AppRoute.instance.adLoginPage
                : AppRoute.instance.adHomePage,
            routes: AppRoute.instance.route,
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              brightness: Brightness.light,
              primaryColor: Color(0xff33302e),
            ),
            // home: const IosLoginPage(),
            home: const IosHomePage(),
            routes: AppRoute.instance.route,
          );
  }
}
