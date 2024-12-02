import 'package:flutter/material.dart';
import 'package:library_store/cubit/note_book.dart';
import 'package:library_store/view/categorys/widgets/note_book_item.dart';

class NoteBookItemAdmin extends StatelessWidget {
  const NoteBookItemAdmin(
      {super.key, required this.noteBookItem, required this.title});
  final NoteBookItem noteBookItem;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) =>
                deleteNoteDialog(context, noteBookItem.noteBook.id, title),
          );
        },
        child: noteBookItem);
  }
}

Widget deleteNoteDialog(context, String id, String title) => AlertDialog(
      content: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        child: MaterialButton(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Text(
              "حذف",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onPressed: () {
              NoteBookCubit.get(context).deleteData(id, title);
              Navigator.pop(context);
            }),
      ),
    );
