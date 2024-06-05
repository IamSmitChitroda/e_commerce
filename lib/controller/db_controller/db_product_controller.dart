import 'package:e_commerce/headers.dart';

class DbProductController with ChangeNotifier {
  DbProductController() {
    getAllData();
  }

  List<DbProduct> allFavProducts = [];
  List<DbProduct> allCartProducts = [];

  getAllData() async {
    allFavProducts = await AppDb.instance.getAllFavProduct();
    allCartProducts = await AppDb.instance.getAllCartProduct();
    notifyListeners();
  }

  addFavouriteProduct({required Products product}) async {
    await AppDb.instance
        .insertFavData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }

  addCartProduct({required Products product}) async {
    await AppDb.instance
        .insertCartData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }
}
