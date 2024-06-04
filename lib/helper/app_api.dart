import 'package:e_commerce/headers.dart';
import 'package:http/http.dart' as http;

class AppApi {
  AppApi._();
  static final AppApi instance = AppApi._();

  Logger logger = Logger();
  String productApi = 'https://dummyjson.com/products';

  List<Products> products = [];

  Future<List<Products>> initApiData() async {
    http.Response response = await http.get(Uri.parse(productApi));
    logger.i(response.statusCode);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['products'];
      products = data.map((e) => Products.fromJson(e)).toList();
    }
    return products;
  }
}
