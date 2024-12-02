import 'package:flutter/material.dart';
import 'package:library_store/constant/admin.dart';
import 'package:library_store/view/categorys/widgets/text_field.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff834299),
        centerTitle: true,
        title: const Text(
          "تسجيل دخول المالك",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 15,
                ),
                CustomTextField(
                  controller: email,
                  title: "البريد الاكتروني",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                CustomTextField(
                  controller: password,
                  title: " كلمة المرور",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (email.text == "Mostafa4433" &&
                          password.text == "Mostafa4433") {
                        isAdmin = true;
                        Navigator.pushReplacementNamed(context, "home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    "البريد الالكتروني او كلمة المرور خاطئه")));
                      }
                    }
                  },
                  color: const Color(0xff834299),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    " تسجيل الدخول",
                    style: TextStyle(
                        fontSize: size.width / 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
