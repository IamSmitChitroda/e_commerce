import 'package:e_commerce/headers.dart';
import 'package:http/http.dart' as http;

class AppApi {
  AppApi._();
  static final AppApi instance = AppApi._();

  Logger logger = Logger();
  String productApi = 'https://dummyjson.com/products';

  List<Products> allProducts = [];

  Future<List<Products>> initApiData({String id = '0'}) async {
    if (id != '0') {
      productApi = 'https://dummyjson.com/products/$id';
    }

    http.Response response = await http.get(Uri.parse(productApi));
    logger.i(response.statusCode);

    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      logger.i('map get $map');
      List data = map['products'];
      logger.i('data getList  $data');
      allProducts = data.map((e) => Products.fromJson(e)).toList();
      logger.i(allProducts);
    }
    return allProducts;
  }
}
