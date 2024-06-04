import 'package:e_commerce/headers.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController mutable = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mutable.allProducts.isNotEmpty
            ? ListView.builder(
                itemCount: mutable.allProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(mutable.allProducts[index].title),
                    ),
                  );
                },
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: const Text('Loading...'),
                ),
              ),
      ),
    );
  }
}
