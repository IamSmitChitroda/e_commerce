import 'package:e_commerce/headers.dart';
import 'package:flutter/cupertino.dart';

class IosLoginPage extends StatelessWidget {
  const IosLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DbUser user = DbUser.empty();
    Logger logger = Logger();
    // =========================================================================
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              const Text(
                'Login into\nyour account',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: size.height * 0.1),
              CupertinoTextField(
                onChanged: (value) {
                  user.email = value;
                },
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              CupertinoTextField(
                onChanged: (value) {
                  user.password = value;
                },
                obscureText: true,
                placeholder: 'Password',
              ),
              SizedBox(height: size.height * 0.03),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?'),
                ],
              ),
              SizedBox(height: size.height * 0.06),
              SizedBox(
                width: double.infinity,
                height: 50,
                child:
                    // ElevatedButton
                    CupertinoButton.filled(
                  onPressed: () async {
                    if (Provider.of<LoginController>(
                      context,
                      listen: false,
                    ).login(user: user)) {
                      Navigator.pushNamed(
                          context, AppRoute.instance.adHomePage);
                    } // if
                    else {
                      logger.i('Login Failed');
                      Navigator.pushNamed(
                          context, AppRoute.instance.adSignupPage);
                    } // else
                  },
                  child: const Text('Login'),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.instance.iosSignupPage,
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
