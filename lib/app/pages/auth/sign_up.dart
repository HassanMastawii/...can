import 'package:flutter/material.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_pass_form_field.dart';
import '../../widgets/my_text_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../Home/home.dart';

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
  final TextEditingController gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 247, 247),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'images/1.png',
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'أهلاً بك في كناري شات',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyTextFormField(
                    labelText: "اسم المستخدم",
                    preIcon: const Icon(
                      Icons.account_circle,
                    ),
                    textEditingController: username,
                    textInputType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyTextPassField(
                    labelText: "كلمة المرور",
                    preIcon: const Icon(Icons.lock),
                    autofillHints: const [AutofillHints.password],
                    textEditingController: password,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyTextPassField(
                    labelText: "تأكيد كلمة المرور",
                    preIcon: const Icon(Icons.lock),
                    autofillHints: const [AutofillHints.password],
                    textEditingController: confirmPassword,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: gender.text.isEmpty ? null : gender.text,
                    padding: const EdgeInsets.all(5),
                    items: const [
                      DropdownMenuItem(value: "أنثى", child: Text("أنثى")),
                      DropdownMenuItem(value: "ذكر", child: Text("ذكر")),
                    ],
                    underline: const SizedBox.shrink(),
                    hint: const Text("الجنس"),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        gender.text = value!;
                      });
                    },
                  ),
                ),
                MyButton(
                  text: "انشاء الحساب",
                  color: Colors.blue,
                  fontColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('لديك حساب بالفعل؟',
                          style: TextStyle(fontSize: 22)),
                      MyTextButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        text: 'سجل دخول',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
