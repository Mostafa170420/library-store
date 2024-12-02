import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:library_store/constant/admin.dart';
import 'package:library_store/models/cart.dart';
import 'package:library_store/models/note_book.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.noteBook});
  final NoteBook noteBook;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: const Color(0xff834299),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: size.height / 2.5,
            width: size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[600]!, blurRadius: 13, spreadRadius: 4)
              ],
              color: const Color(0xff834299),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    noteBook.image,
                    height: size.height / 4,
                    width: size.width / 3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Text(
                  noteBook.title,
                  style: TextStyle(
                      fontSize: size.width / 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "الوصف",
                    style: TextStyle(
                      fontSize: size.width / 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    noteBook.numOfPage,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    "السعر : ${noteBook.price} ج.م",
                    style: TextStyle(
                      fontSize: size.width / 15,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: MaterialButton(
                    onPressed: () {
                      items.add(CartItem(noteBook: noteBook));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                          content: Text(
                            "اضافة ناجحة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )));
                    },
                    color: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color(0xff834299), width: 2)),
                    child: AutoSizeText(
                      "اضافة الي العربة",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 17,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff834299)),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.7,
                  child: MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: AutoSizeText(
                            " عملية الشراء ليست متاحة في الوقت الحالي",
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )));
                    },
                    color: const Color(0xff834299),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AutoSizeText(
                      " شراء",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: size.width / 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
