import 'package:e_commerce/headers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  // int i = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ProductController mutable = Provider.of<ProductController>(context);
    ProductController unmutable =
        Provider.of<ProductController>(context, listen: false);
    Products p = mutable.allProducts[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(padding: const EdgeInsets.all(16), child: Text(p.title)),
    );
  }
}
