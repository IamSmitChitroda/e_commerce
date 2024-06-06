import 'package:e_commerce/headers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DbUser user = DbUser.empty();
    Logger logger = Logger();
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
                'Login into\nyour account',
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
                child: ElevatedButton(
                  onPressed: () async {
                    if (Provider.of<LoginController>(
                      context,
                      listen: false,
                    ).login(user: user)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Successful'),
                        ),
                      );
                      Navigator.pushNamed(context, AppRoute.instance.homePage);
                    } // if
                    else {
                      logger.i('Login Failed');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Failed'),
                        ),
                      );
                      Navigator.pushNamed(
                          context, AppRoute.instance.signupPage);
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoute.instance.signupPage);
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
