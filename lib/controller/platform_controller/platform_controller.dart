import 'package:e_commerce/headers.dart';

class PlatformController with ChangeNotifier {
  bool isAndroid = false;

  void changePlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
