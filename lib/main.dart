import 'package:e_commerce/controller/db_controller/db_product_controller.dart';
import 'package:e_commerce/headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDb.instance.initDb();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginController(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => DbProductController(),
        ),
      ], // providers
      child: const MyApp(),
    ),
  );
}
