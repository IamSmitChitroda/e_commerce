import 'package:e_commerce/headers.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute instance = AppRoute._();

  String adHomePage = "ad_hp";
  String adLoginPage = "ad_lp";
  String adSignupPage = "ad_sup";
  String adDetailPage = "ad_dp";

  String iosHomePage = "ios_hp";
  String iosLoginPage = "ios_lp";
  String iosSignupPage = "ios_sup";
  String iosDetailPage = "ios_dp";

  Map<String, Widget Function(BuildContext)> route = {
    "ad_hp": (context) => const AdHomePage(),
    "ad_lp": (context) => const AdLoginPage(),
    "ad_sup": (context) => const AdSignupPage(),
    "ad_dp": (context) => const AdDetailPage(),
    "ios_lp": (context) => const IosLoginPage(),
    "ios_sup": (context) => const IosSignupPage(),
    "ios_hp": (context) => const IosHomePage(),
    // "ios_dp": (context) => const IosDetailPage(),
  };
}
