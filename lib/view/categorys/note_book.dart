import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/constant/admin.dart';
import 'package:library_store/cubit/note_book.dart';
import 'package:library_store/cubit/note_book_state.dart';
import 'package:library_store/view/categorys/widgets/add_note_book.dart';
import 'package:library_store/view/categorys/widgets/note_book_item.dart';
import 'package:library_store/view/categorys/widgets/note_book_item_admin.dart';
import 'package:library_store/view/categorys/widgets/text_field.dart';
import 'package:library_store/view/item_details/item_details.dart';

class NoteBookScrean extends StatelessWidget {
  NoteBookScrean({super.key, required this.title, required this.categoryName});
  String categoryName;
  String title;
  @override
  Widget build(BuildContext context) {
    NoteBookCubit noteBookCubit = NoteBookCubit.get(context)..getData(title);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff834299),
          centerTitle: true,
          title: Text(
            categoryName,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: BlocBuilder<NoteBookCubit, NoteBookStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is SuccessState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                  itemCount: state.noteBooks.length,
                  itemBuilder: (context, index) => isAdmin
                      ? NoteBookItemAdmin(
                          title: title,
                          noteBookItem:
                              NoteBookItem(noteBook: state.noteBooks[index]),
                        )
                      : InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetails(
                                    noteBook: state.noteBooks[index]),
                              )),
                          child:
                              NoteBookItem(noteBook: state.noteBooks[index])),
                ),
              );
            } else {
              return const Center(
                child: Text("خطأ"),
              );
            }
          },
        ),
        floatingActionButton: isAdmin
            ? FloatingActionButton(
                backgroundColor: const Color(0xff834299),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddNoteBook(
                            titleCategory: title,
                          ));
                })
            : null);
  }
}
