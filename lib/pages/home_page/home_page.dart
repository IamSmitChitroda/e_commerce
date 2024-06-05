import 'package:e_commerce/headers.dart';
import 'package:e_commerce/pages/home_page/components/hp_appbar.dart';
import 'package:e_commerce/pages/home_page/components/hp_shimmer_effect.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    String selectedCategory = "All";
    ProductController mutable = Provider.of<ProductController>(context);
    ProductController unmutable =
        Provider.of<ProductController>(context, listen: false);
    Logger logger = Logger();
    return Scaffold(
      appBar: hpAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mutable.allProducts.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: mutable.allCategories.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          selectedCategory = mutable.allCategories[index];
                          logger.i(
                              'Tap: ${mutable.allCategories[index]}\nVar: $selectedCategory');
                          unmutable.specificCategoryProduct(
                              selectedCategory: selectedCategory);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 80,
                          width: 70,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.brown,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            mutable.allCategories[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: mutable.allProducts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading:
                                Text(mutable.allProducts[index].id.toString()),
                            title: Text(mutable.allProducts[index].title),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : hpShimmerEffect(),
      ),
    );
  }
}
