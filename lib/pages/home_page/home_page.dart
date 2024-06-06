import 'package:e_commerce/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ProductController mutable = Provider.of<ProductController>(context);
    ProductController unmutable =
        Provider.of<ProductController>(context, listen: false);
    var logger = Logger();
    return Scaffold(
      appBar: hpAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mutable.allProducts.isNotEmpty
            ? ListView(
                children: [
                  categoryTile(
                    mutable: mutable,
                    unmutable: unmutable,
                    size: size,
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    width: double.infinity,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage('lib/assets/cn.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  hpProductList(
                    mutable: mutable,
                    unmutable: unmutable,
                    size: size,
                    context: context,
                  ),
                ],
              )
            : hpShimmerEffect(),
      ),
    );
  }
}
