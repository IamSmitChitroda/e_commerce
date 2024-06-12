import 'package:e_commerce/headers.dart';

class PopController with ChangeNotifier {
  bool canPop = false;

  void pop() {
    canPop = !canPop;
    notifyListeners();
  }
}
