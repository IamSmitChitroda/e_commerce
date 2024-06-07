import 'package:e_commerce/headers.dart';
import 'package:http/http.dart' as http;

class AppApi {
  AppApi._();
  static final AppApi instance = AppApi._();

  Logger logger = Logger();
  String productApi = 'https://dummyjson.com/products';

  List<Products> allProducts = [];

  Future<List<Products>> initApiData({String? id}) async {
    if (id != null) {
      productApi = 'https://dummyjson.com/products/$id';
    }

    http.Response response = await http.get(Uri.parse(productApi));
    logger.i(response.statusCode);

    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      logger.i('map get title: ${map['products']}');

      allProducts.clear();

      if (id != null) {
        allProducts.add(Products.fromJson(map as Map<String, dynamic>));
        logger
            .i("Length: ${allProducts.length}\nName: ${allProducts[0].title}");
      } else {
        List<Map<String, dynamic>> list = map['products'];
        allProducts = list.map((e) => Products.fromJson(e)).toList();
      }
    }
    return allProducts;
  }
}
