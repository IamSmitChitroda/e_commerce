import 'package:e_commerce/headers.dart';
import 'package:flutter/cupertino.dart';

class IosSignupPage extends StatelessWidget {
  const IosSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DbUser user = DbUser.empty();
    // =========================================================================
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              const Text(
                'Create\nyour account',
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
              const SizedBox(
                height: 15,
              ),
              CupertinoTextField(
                onChanged: (value) {
                  user.password = value;
                },
                obscureText: true,
                placeholder: 'Confirm Password',
              ),
              SizedBox(height: size.height * 0.08),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CupertinoButton.filled(
                  onPressed: () async {
                    Provider.of<LoginController>(
                      context,
                      listen: false,
                    );
                  },
                  child: const Text('Sign up'),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoute.instance.adLoginPage);
                    },
                    child: const Text('Login'),
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
