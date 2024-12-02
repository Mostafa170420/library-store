import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/nav_bar.dart';
import 'package:library_store/view/categorys/note_book.dart';
import 'package:library_store/view/home/widgets/home_category.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarCubit navBarCubit = NavBarCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff834299),
        centerTitle: true,
        title: const Text(
          " أدواتي المدرسيه",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteBookScrean(
                      title: "noteBook",
                      categoryName: "كشكول",
                    ),
                  )),
              child: const HomeCategory(
                title: "كشكول",
                color: Colors.blue,
                route: "note",
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteBookScrean(
                      title: "pen",
                      categoryName: "قلم",
                    ),
                  )),
              child: const HomeCategory(
                  title: "قلم",
                  color: Color.fromARGB(255, 230, 98, 54),
                  route: "note"),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteBookScrean(
                      title: "bottle",
                      categoryName: "زمزامية",
                    ),
                  )),
              child: const HomeCategory(
                  title: "زمزامية", color: Colors.green, route: "note"),
            )
          ],
        ),
      ),
    );
  }
}
