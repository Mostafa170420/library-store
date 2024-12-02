import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: size.width / 3.7,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        color: const Color(0xff834299),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: AutoSizeText(
                                maxLines: 1,
                                "المسؤول",
                                style: TextStyle(
                                    fontSize: size.width / 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/logo.png",
                      width: size.width / 1.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "أدواتي المدرسيه",
                    style: TextStyle(
                        fontSize: size.width / 10, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    "تطبيق أدواتي المدرسيه يوفر أحث قوائم بالكتب والدوريات وتوزيعها على المختصين للإختيار والأقتراح وجمع المقترحات إتخاذ إجراءات شراء الكتب الدراسية والمراجع اللازمة والكتب الجديدة المختصة والأشتراك فى الدوريات وتجليدها",
                    style: TextStyle(
                        fontSize: size.width / 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]),
                  ),
                  SizedBox(
                    height: size.height / 17,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "home");
                    },
                    color: const Color(0xff834299),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "الصفحة الرئيسية",
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
        ));
  }
}
