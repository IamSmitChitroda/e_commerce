import 'package:e_commerce/headers.dart';

class AdDetailPage extends StatefulWidget {
  const AdDetailPage({super.key});

  @override
  State<AdDetailPage> createState() => _AdDetailPageState();
}

class _AdDetailPageState extends State<AdDetailPage> {
  // int i = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ProductController mutable = Provider.of<ProductController>(context);
    ProductController unmutable =
        Provider.of<ProductController>(context, listen: false);
    Products p = mutable.allProducts[0];

    return
        // PopScope(
        // canPop: Provider.of<PopController>(context).canPop,
        // onPopInvoked: (bool value) {
        //   showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //       title: const Text('Are you sure?'),
        //       content: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           const Text('Are you sure you want to exit?'),
        //           const SizedBox(height: 16),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.pop(context);
        //                 },
        //                 child: const Text('No'),
        //               ),
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.pop(context);
        //                   Navigator.pop(context);
        //                 },
        //                 child: const Text('Yes'),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // },
        // child:
        Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mutable.allProducts.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: size.height * 0.55,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            p.images[0],
                          ),
                        ),
                        Align(
                          alignment: const Alignment(-1, -0.9),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      // ),
    );
  }
}
