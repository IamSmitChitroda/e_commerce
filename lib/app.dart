import 'package:e_commerce/headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff33302e),
      ),
      initialRoute: Provider.of<LoginController>(context).isFirstTime
          ? AppRoute.instance.loginPage
          : AppRoute.instance.homePage,
      routes: AppRoute.instance.route,
    );
  }
}
