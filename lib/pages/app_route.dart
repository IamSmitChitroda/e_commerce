import 'package:e_commerce/headers.dart';
import 'package:e_commerce/pages/sinup_page/sinup_page.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute instance = AppRoute._();

  String homePage = "hp";
  String loginPage = "lp";
  String signupPage = "cp";

  Map<String, Widget Function(BuildContext)> route = {
    "hp": (context) => const HomePage(),
    "lp": (context) => const LoginPage(),
    "cp": (context) => const SignupPage(),
  };
}