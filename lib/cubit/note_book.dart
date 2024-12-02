import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/note_book_state.dart';
import 'package:library_store/models/note_book.dart';
import 'package:library_store/repository/note_book.dart';

class NoteBookCubit extends Cubit<NoteBookStates> {
  NoteBookCubit() : super(NoteBookStates());
  static NoteBookCubit get(context) => BlocProvider.of(context);
  List<NoteBook> noteBooks = [];
  NoteBookRepository noteBookRepository = NoteBookRepository();
  getData(String categoty) async {
    try {
      emit(LoadingState());
      noteBooks = await noteBookRepository.getNotes(categoty);
      print("ff");
      emit(SuccessState(noteBooks: noteBooks));
    } catch (e) {
      emit(FailedState());
    }
  }

  addData(Map<String, dynamic> map, String categoty) async {
    try {
      await noteBookRepository.addNote(map, categoty);
      noteBooks = await noteBookRepository.getNotes(categoty);
      emit(SuccessState(noteBooks: noteBooks));
    } catch (e) {
      emit(FailedState());
    }
  }

  deleteData(String id, String categoty) async {
    try {
      await noteBookRepository.deleteNote(id, categoty);
      noteBooks = await noteBookRepository.getNotes(categoty);
      emit(SuccessState(noteBooks: noteBooks));
    } catch (e) {
      print(e);
      emit(FailedState());
    }
  }
}
