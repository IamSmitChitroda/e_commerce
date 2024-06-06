import 'package:e_commerce/headers.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DbUser user = DbUser.empty();
    // =========================================================================
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(32),
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
              TextField(
                onChanged: (value) {
                  user.email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  user.password = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              TextField(
                onChanged: (value) {
                  user.password = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                ),
              ),
              SizedBox(height: size.height * 0.08),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<LoginController>(
                      context,
                      listen: false,
                    ).signup(user: user).then((value) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoute.instance.loginPage,
                      );
                    });
                  },
                  child: const Text('Sign up'),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoute.instance.loginPage);
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
