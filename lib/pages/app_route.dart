import 'package:e_commerce/headers.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute instance = AppRoute._();

  String homePage = "hp";
  String loginPage = "lp";
  String signupPage = "cp";
  String detailPage = "dp";

  Map<String, Widget Function(BuildContext)> route = {
    "hp": (context) => const HomePage(),
    "lp": (context) => const LoginPage(),
    "cp": (context) => const SignupPage(),
    "dp": (context) => const DetailPage(),
  };
}
