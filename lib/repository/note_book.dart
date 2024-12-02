import 'package:library_store/models/note_book.dart';
import 'package:library_store/remote/firestore_helper.dart';
import 'dart:math';

class NoteBookRepository {
  final firestoreHelper = FirestoreHelper();
  List<NoteBook> _noteBooks = [];
  Future<List<NoteBook>> getNotes(String categoty) async {
    try {
      await _getData(categoty);
      return _noteBooks;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> _getData(String categoty) async {
    try {
      var data = await firestoreHelper.getDocs(categoty);
      _noteBooks = [];
      for (var doc in data) {
        print("xx");
        _noteBooks.add(NoteBook.fromFirebase(doc));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addNote(Map<String, dynamic> map, String categoty) async {
    try {
      var rand = Random();
      int id = rand.nextInt(9999999) + 1;
      await firestoreHelper.addDoc(categoty, id.toString(), map);
      _noteBooks.add(NoteBook(map, id.toString()));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteNote(String id, String categoty) async {
    try {
      await firestoreHelper.deleteDoc(categoty, id);
      for (int i = 0; i < _noteBooks.length; i++) {
        if (_noteBooks[i].id == id) {
          _noteBooks.removeAt(i);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
