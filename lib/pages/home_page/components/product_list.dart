import 'package:e_commerce/headers.dart';
import 'package:flutter/cupertino.dart';

Widget hpProductList({
  required ProductController mutable,
  required ProductController unmutable,
  required Size size,
  required BuildContext context,
}) {
  DbProductController dbMutable = Provider.of<DbProductController>(context);
  DbProductController dbUnmutable =
      Provider.of<DbProductController>(context, listen: false);
  return Column(
    children: List.generate(
      mutable.allProducts.length,
      (index) {
        Products p = mutable.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoute.instance.detailPage,
              arguments: index,
            );
          },
          child: Container(
            height: size.height * 0.25,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: index % 2 == 0
                  ? Colors.white54
                  : index % 5 == 0
                      ? Colors.white38
                      : Colors.white70,
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.network(p.thumbnail),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
                              child: IconButton(
                                onPressed: () {
                                  dbUnmutable.isInFav(product: p)
                                      ? dbUnmutable.addFavouriteProduct(
                                          product: p)
                                      : dbUnmutable.removeFavouriteProduct(
                                          product: p);
                                },
                                icon: Icon(
                                  dbUnmutable.isInFav(product: p)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.cart_fill)),
                            )
                          ],
                        ),
                        Text(
                          p.title,
                          style: const TextStyle(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          p.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // ===========================================================

                        const Spacer(),
                        Text(
                          '₹ ${(p.price * 80).toInt()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
