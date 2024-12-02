import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/cart.dart';
import 'package:library_store/cubit/cart_states.dart';
import 'package:library_store/view/home/widgets/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = CartCubit.get(context)..getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff834299),
        centerTitle: true,
        title: const Text(
          "  عربة الشراء",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoadState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) => CartScreanItem(
                cartItem: state.items[index],
                index: index,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
