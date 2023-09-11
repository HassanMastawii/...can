// ignore_for_file: file_names
import 'package:canary_app/app/components/model_bottom_sheet/lang_sheet.dart';
import 'package:canary_app/app/pages/auth/sign_up.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/device/locale/locale.dart';
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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  login() async {
    final loginState = await context.read<CoreProvider>().logIn(User(
          email: email.text,
          password: password.text,
        ));
    if (loginState is DoneState && mounted) {
      MySnackBar.showDoneToast();
      MyRouter.myPushReplacmentAll(context, const Home());
    } else if (loginState is ErrorState && mounted) {
      MySnackBar.showMyToast(text: loginState.failure.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 247, 247),
      body: Form(
        key: _key,
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => const LangSheet(),
                    );
                  },
                  icon: const Icon(Icons.language)),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/1.png',
                        height: 200,
                      ),
                      Text(
                        getText(context, "welcomeback"),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: MyTextFormField(
                          labelText: getText(context, "email"),
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
                          labelText: getText(context, "password"),
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
                            MyTextButton(
                              onTap: () {},
                              color: Colors.red,
                              text: getText(context, "forgetpassword"),
                            ),
                          ],
                        ),
                      ),
                      MyButton(
                        text: getText(context, "login"),
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
                            Text(getText(context, "donthaveaccount"),
                                style: const TextStyle(fontSize: 22)),
                            MyTextButton(
                              onTap: () {
                                MyRouter.myPush(context, const RegisterPage());
                              },
                              color: Colors.blue,
                              text: getText(context, "register"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
