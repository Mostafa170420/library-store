import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/Image_storage_state.dart';
import 'package:library_store/cubit/image_storage.dart';
import 'package:library_store/cubit/note_book.dart';
import 'package:library_store/view/categorys/widgets/text_field.dart';

class AddNoteBook extends StatelessWidget {
  AddNoteBook({super.key, required this.titleCategory});

  final TextEditingController title = TextEditingController();

  final TextEditingController numOfPage = TextEditingController();
  final String titleCategory;
  final TextEditingController price = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? image;

  Uint8List web = Uint8List(8);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ImageStorageCubit imageStorageCubit = ImageStorageCubit();
    return BlocProvider(
      create: (context) => imageStorageCubit,
      child: AlertDialog(
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "اضافة منتج",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ImageStorageCubit, ImageStorageStates>(
                  buildWhen: (previous, current) =>
                      !((current is LoadingState) | (current is SuccessState)),
                  builder: (context, state) {
                    if (state is InitialState) {
                      print("pp");
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: image == null
                                  ? Colors.purple[300]
                                  : Colors.transparent),
                          height: size.height / 6,
                          width: size.width / 5,
                          child: InkWell(
                            onTap: () => imageStorageCubit.pickImage(),
                            child: Icon(
                              Icons.image,
                              color: Colors.white,
                              size: size.width / 10,
                            ),
                          ));
                    } else if (state is ImagePickedState) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.memory(
                          state.web,
                          height: size.height / 6,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return const Text("خطأ في الاتصال");
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  title: "اسم المنتج",
                  controller: title,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  title: "وصف المنتج ",
                  controller: numOfPage,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  title: "السعر",
                  controller: price,
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  width: size.width / 1.5,
                  child: MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate() &
                          (ImageStorageCubit.file != null)) {
                        Map<String, dynamic> map = await imageStorageCubit
                            .uploadData(title.text, numOfPage.text, price.text);
                        NoteBookCubit.get(context).addData(map, titleCategory);
                        Navigator.pop(context);
                        print("df");
                      }
                    },
                    color: Colors.black,
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: BlocBuilder<ImageStorageCubit, ImageStorageStates>(
                      builder: (context, state) {
                        if ((state is InitialState) |
                            (state is ImagePickedState)) {
                          return const Text(
                            "اضافة",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          );
                        } else if (state is LoadingState) {
                          print("xxx");

                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        } else {
                          return const Text(
                            "خطا",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
