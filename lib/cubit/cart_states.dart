import 'package:library_store/models/cart.dart';

class CartState {}

class CartLoadState extends CartState {
  List<CartItem> items;
  CartLoadState({required this.items});
}
