import 'package:e_commerce/headers.dart';

class LoginController with ChangeNotifier {
  LoginController({required this.sharedPreferences}) {
    getAllUser();
  }

  List<DbUser> allUser = [];
  bool isFirstTime = true;
  Logger logger = Logger();
  SharedPreferences sharedPreferences;

  Future<void> getAllUser() async {
    allUser = await AppDb.instance.getAllLoginData();
    notifyListeners();
  }

  bool login({required DbUser user}) {
    // await getAllUser();
    // logger.i(allUser[0].email);
    bool value = false;
    notifyListeners();
    // return allUser.contains(user);

    allUser.forEach(
      (element) async {
        bool value =
            element.email == user.email && element.password == user.password;

        isFirstTime = !isFirstTime;
        await sharedPreferences.setBool('isFirstTime', isFirstTime);
      },
    );

    return value;
  }

  Future<void> signup({required DbUser user}) async {
    await AppDb.instance.insertSignupData(user: user).then(
      (value) {
        logger.i('!Login CTR! Sing up Account created successfully');
        getAllUser();
      },
    ).onError(
      (error, stackTrace) {
        logger.e(' !Login CTR! Sing up $error');
      },
    );
  }
}
