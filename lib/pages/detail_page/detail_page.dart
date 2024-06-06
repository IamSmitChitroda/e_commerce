import 'package:e_commerce/headers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController mutable = Provider.of<ProductController>(context);
    ProductController unmutable =
        Provider.of<ProductController>(context, listen: false);
    int index = ModalRoute.of(context)?.settings.arguments as int ?? 0;

    unmutable.getProduct(id: index.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
    );
  }
}
