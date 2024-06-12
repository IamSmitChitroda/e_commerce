import 'package:e_commerce/headers.dart';

class ProductController with ChangeNotifier {
  ProductController() {
    getAllProduct();
  }

  List<Products> allProducts = [];
  List<Products> _products = [];
  List<String> allCategories = [];
  String selectedCategory = 'All';

  Logger logger = Logger();
  Future<void> getAllProduct() async {
    logger.i('!PRO CTR!  enter getAllProduct');
    allProducts = await AppApi.instance.initApiData();
    allCategories = allProducts.map((e) => e.category!).toList();
    allCategories = allCategories.toSet().toList();
    allCategories.insert(0, 'All');

    logger.i('!PRO CTR! allPro:  ${allProducts.length}');
    logger.i('!PRO CTR! allCat:  ${allCategories.length}');
    _products = allProducts;
    notifyListeners();
  }

  void specificCategoryProduct() {
    logger.i('!PRO CTR!  enter speCatePro');

    selectedCategory != "All"
        ? allProducts = allProducts
            .where(
              (element) => selectedCategory == element.category,
            )
            .toList()
        : allProducts = _products;

    logger.i(' !PRO CTR! speCatePro:  ${allProducts.length}');
    notifyListeners();
  }

  Future<void> dpData({required String id}) async {
    logger.i('!PRO CTR!  enter getProduct');
    allProducts = await AppApi.instance.initApiData(id: id);
    logger.i(' !PRO CTR! getPro:  ${allProducts.length}');
    notifyListeners();
  }

  void getAllListReturn() {
    allProducts = _products;
    notifyListeners();
  }
}
