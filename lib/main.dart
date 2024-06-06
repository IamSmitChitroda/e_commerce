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
  bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginController(
              sharedPreferences: sharedPreferences, isFirstTime: isFirstTime),
        ),
        ChangeNotifierProvider(
          create: (_) => DbProductController(),
        ),
      ], // providers
      child: const MyApp(),
    ),
  );
}
