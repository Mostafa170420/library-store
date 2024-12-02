import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory(
      {super.key,
      required this.title,
      required this.color,
      required this.route});
  final Color color;
  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 5,
      width: size.width,
      padding: const EdgeInsets.only(right: 15),
      alignment: Alignment.centerRight,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
