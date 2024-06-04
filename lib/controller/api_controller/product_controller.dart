import 'package:e_commerce/headers.dart';

class ProductController with ChangeNotifier {
  ProductController() {
    initDataFromApi();
  }

  List<Products> allProducts = [];

  Future<void> initDataFromApi() async {
    allProducts = await AppApi.instance.initApiData();
    notifyListeners();
  }
}
