import 'package:e_commerce/headers.dart';

Widget categoryTile({
  required ProductController mutable,
  required ProductController unmutable,
  required Size size,
}) {
  Logger logger = Logger();
  return SizedBox(
    height: size.height * 0.082,
    width: double.infinity,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: mutable.allCategories.length,
      // =======================================================
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          mutable.selectedCategory = mutable.allCategories[index];
          logger.i(
              'Tap: ${mutable.allCategories[index]}\nVar: ${mutable.selectedCategory}');
          unmutable.specificCategoryProduct();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 5, left: 5),
          // height: 70,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: mutable.selectedCategory == mutable.allCategories[index]
                ? Colors.brown
                : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Text(
            mutable.allCategories[index].replaceFirst(
              mutable.allCategories[index][0],
              mutable.allCategories[index][0].toUpperCase(),
            ),
            style: TextStyle(
              color: mutable.selectedCategory == mutable.allCategories[index]
                  ? Colors.white
                  : Colors.black,
            ),
            maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );
}
