import 'package:canary_app/app/components/model_bottom_sheet/lang_sheet.dart';
import 'package:canary_app/app/home/button_navgetion_bar.dart';
import 'package:canary_app/app/provider/providers/core_provider.dart';
import 'package:canary_app/app/router/my_router.dart';
import 'package:canary_app/device/locale/locale.dart';
import 'package:canary_app/domain/models/user.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/toast.dart';
import '../../provider/states/states.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_pass_form_field.dart';
import '../../widgets/my_text_button.dart';
import '../../widgets/my_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController username = TextEditingController();
  int? gender;
  String? country;
  register() async {
    if (!_key.currentState!.validate()) {
      MySnackBar.showMyToast(text: "أملئ الحقول بشكل مناسب");
    } else if (password.text != confirmPassword.text) {
      MySnackBar.showMyToast(text: "كلمتي المرور غير متطابقتين");
    } else if (gender == null) {
      MySnackBar.showMyToast(text: "أختر جنسك");
    } else if (country == null) {
      MySnackBar.showMyToast(text: "أختر بلدك");
    } else {
      final registerstate = await context.read<CoreProvider>().register(User(
            contry: country,
            email: email.text,
            gender: gender,
            name: username.text,
            password: password.text,
          ));
      if (registerstate is DoneState && mounted) {
        MySnackBar.showDoneToast();
        MyRouter.myPushReplacmentAll(context, const Home());
      } else if (registerstate is ErrorState && mounted) {
        MySnackBar.showMyToast(text: registerstate.failure.message);
      }
    }
  }

  final List<String> genders = ["male", "female"];
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 247, 247),
      body: SafeArea(
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
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/1.png',
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          getText(context, "welcome"),
                          style: const TextStyle(
                            fontSize: 22,
                          ),
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
                        child: MyTextFormField(
                          labelText: getText(context, "username"),
                          preIcon: const Icon(
                            Icons.account_circle,
                          ),
                          minimum: 2,
                          textEditingController: username,
                          textInputType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: MyTextPassField(
                          labelText: getText(context, "password"),
                          preIcon: const Icon(Icons.lock),
                          minChar: 6,
                          autofillHints: const [AutofillHints.password],
                          textEditingController: password,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: MyTextPassField(
                          labelText:
                              "${getText(context, "confirm")} ${getText(context, "password")}",
                          minChar: 6,
                          preIcon: const Icon(Icons.lock),
                          autofillHints: const [AutofillHints.password],
                          textEditingController: confirmPassword,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<int>(
                          value: gender,
                          padding: const EdgeInsets.all(5),
                          items: [
                            DropdownMenuItem(
                                value: 0,
                                child: Text(
                                  getText(context, "male"),
                                )),
                            DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  getText(context, "female"),
                                )),
                          ],
                          underline: const SizedBox.shrink(),
                          hint: Text(
                            getText(context, "gender"),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    getText(context, "country"),
                                  ),
                                ),
                              ),
                              CountryCodePicker(
                                showCountryOnly: true,
                                showDropDownButton: true,
                                countryFilter: codes
                                    .map((e) => e["code"].toString())
                                    .toList()
                                  ..removeWhere((element) => element == "IL"),
                                onChanged: (value) {
                                  country = value.code;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      MyButton(
                        text: getText(context, "register"),
                        color: Colors.blue,
                        isLoading: context.watch<CoreProvider>().isLoading,
                        fontColor: Colors.white,
                        onPressed: () async {
                          await register();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(getText(context, "haveaccount"),
                                style: const TextStyle(fontSize: 22)),
                            MyTextButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              color: Colors.blue,
                              text: getText(context, "login"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
