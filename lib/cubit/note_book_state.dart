import 'package:library_store/models/note_book.dart';

class NoteBookStates {}

class LoadingState extends NoteBookStates {}

class SuccessState extends NoteBookStates {
  List<NoteBook> noteBooks;
  SuccessState({required this.noteBooks});
}

class FailedState extends NoteBookStates {}
