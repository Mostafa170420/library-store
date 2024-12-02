import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:library_store/cubit/cart.dart';
import 'package:library_store/models/cart.dart';

class CartScreanItem extends StatelessWidget {
  const CartScreanItem(
      {super.key, required this.cartItem, required this.index});
  final int index;
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    CartCubit cart = CartCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 5,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                cartItem.noteBook.image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AutoSizeText(
                    cartItem.noteBook.title,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${cartItem.noteBook.price} ج.م",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    cart.minsItem(index);
                  },
                  child: Container(
                    height: width / 12,
                    width: width / 12,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "-",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  cartItem.counter.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    cart.plusItem(index);
                  },
                  child: Container(
                    height: width / 12,
                    width: width / 13,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "+",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
