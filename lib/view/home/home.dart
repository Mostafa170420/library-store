import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/nav_bar.dart';
import 'package:library_store/view/categorys/note_book.dart';
import 'package:library_store/view/home/cart.dart';
import 'package:library_store/view/home/home_screan.dart';
import 'package:library_store/view/home/widgets/home_category.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List screans = [const HomeScrean(), const Cart()];
  @override
  Widget build(BuildContext context) {
    NavBarCubit navBarCubit = NavBarCubit.get(context);
    return Scaffold(
      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return screans[navBarCubit.index];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: state,
              onTap: (value) => navBarCubit.changeIndex(value),
              selectedItemColor: const Color(0xff834299),
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: "Cart")
              ]);
        },
      ),
    );
  }
}
