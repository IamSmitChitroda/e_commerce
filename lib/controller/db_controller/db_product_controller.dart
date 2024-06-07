import 'package:e_commerce/headers.dart';

class DbProductController with ChangeNotifier {
  DbProductController() {
    getAllData();
  }

  List<DbProduct> allFavProducts = [];
  List<DbProduct> allCartProducts = [];

  Future<void> getAllData() async {
    allFavProducts = await AppDb.instance.getAllFavProduct();
    allCartProducts = await AppDb.instance.getAllCartProduct();
    notifyListeners();
  }

  Future<void> addFavouriteProduct({required Products product}) async {
    await AppDb.instance
        .insertFavData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }

  Future<void> addCartProduct({required Products product}) async {
    await AppDb.instance
        .insertCartData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }

  Future<void> deleteFavouriteProduct({required Products product}) async {
    await AppDb.instance
        .deleteFavData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }

  Future<void> deleteCartProduct({required Products product}) async {
    await AppDb.instance
        .deleteCartData(product: DbProduct.fromJson(product.toJson()));
    getAllData();
  }

  bool isInFav({required Products product}) {
    bool val = false;
    for (DbProduct element in allFavProducts) {
      if (element.id == product.id) {
        val = true;
        break;
      }
    }
    return val;
  }

  bool isInCart({required Products product}) {
    bool val = false;
    for (DbProduct element in allCartProducts) {
      if (element.id == product.id) {
        val = true;
        break;
      }
    }
    return val;
  }
}
