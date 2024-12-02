import 'package:library_store/models/note_book.dart';

class CartItem {
  late NoteBook noteBook;
  int counter = 1;
  CartItem({required this.noteBook});
  void plusCounter() {
    counter++;
  }

  void minsCounter() {
    counter--;
  }
}
