import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/constant/admin.dart';
import 'package:library_store/cubit/cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());
  static CartCubit get(context) => BlocProvider.of(context);
  void getData() {
    emit(CartLoadState(items: items));
  }

  void plusItem(int index) {
    items[index].plusCounter();
    emit(CartLoadState(items: items));
  }

  void minsItem(int index) {
    if (items[index].counter == 1) {
      items.removeAt(index);
      emit(CartLoadState(items: items));
    } else {
      items[index].minsCounter();
      emit(CartLoadState(items: items));
    }
  }
}
