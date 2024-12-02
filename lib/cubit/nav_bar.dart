import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<int> {
  static NavBarCubit get(context) => BlocProvider.of(context);
  NavBarCubit() : super(0);
  int index = 0;
  changeIndex(int index) {
    this.index = index;
    emit(index);
  }
}
