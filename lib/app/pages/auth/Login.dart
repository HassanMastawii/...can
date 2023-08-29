// ignore_for_file: file_names
import 'package:canary_app/app/pages/auth/sign_up.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/user.dart';
import '../../components/toast.dart';
import '../../provider/providers/core_provider.dart';
import '../../widgets/my_pass_form_field.dart';
import '../../widgets/my_text_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../Home/home.dart';

class Login extends StatefulWidget {
  static const String ssroot = 'Login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  bool isRememberMe = false;

  login() async {
    final loginState = await context.read<CoreProvider>().logIn(User(
          email: email.text,
          password: password.text,
        ));
    if (loginState is DoneState && mounted) {
      MySnackBar.showDoneToast();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if (loginState is ErrorState && mounted) {
      MySnackBar.showMyToast(text: loginState.failure.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 197, 247, 247),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'images/1.png',
                    height: 200,
                  ),
                  const Text(
                    "أهلاً بعودتك في كناري شات",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: MyTextFormField(
                      labelText: "الايميل",
                      preIcon: const Icon(
                        Icons.alternate_email_outlined,
                      ),
                      textEditingController: email,
                      textInputType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: MyTextPassField(
                      labelText: "كلمة المرور",
                      minChar: 6,
                      preIcon: const Icon(Icons.lock),
                      autofillHints: const [AutofillHints.password],
                      textEditingController: password,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isRememberMe,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            const Text(
                              "تذكرني",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        MyTextButton(
                          onTap: () {},
                          color: Colors.red,
                          text: 'نسيت كلمة السر؟',
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    text: "تسجيل الدخول",
                    color: Colors.blue,
                    isLoading: context.watch<CoreProvider>().isLoading,
                    fontColor: Colors.white,
                    onPressed: () async {
                      await login();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('لا تملك حساب ؟ ',
                            style: TextStyle(fontSize: 22)),
                        MyTextButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          color: Colors.blue,
                          text: 'انشأ الان',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
