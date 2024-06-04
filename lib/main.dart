import 'package:e_commerce/headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDb.instance.initDb();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
