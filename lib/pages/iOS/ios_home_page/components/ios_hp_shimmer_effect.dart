import 'package:e_commerce/headers.dart';

Widget iosHpShimmerEffect() => Padding(
      padding: const EdgeInsets.only(top: 95),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          child: Column(
            children: List.generate(
              5,
              (index) => const Card(
                child: Row(
                  children: [
                    SizedBox(
                      height: 127,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
