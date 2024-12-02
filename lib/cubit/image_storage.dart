import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_store/cubit/Image_storage_state.dart';
import 'package:library_store/cubit/note_book.dart';
import 'package:path/path.dart';

class ImageStorageCubit extends Cubit<ImageStorageStates> {
  ImageStorageCubit() : super(InitialState());
  static XFile? file;
  pickImage() async {
    try {
      Uint8List web = Uint8List(8);
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
      var webFile = await file!.readAsBytes();
      web = webFile;
      emit(ImagePickedState(web: web));
    } catch (e) {
      print("111111111111");
      print(e);
      emit(FailedState());
    }
  }

  Future<Map<String, dynamic>> uploadData(
      String title, String numOfPage, String price) async {
    try {
      emit(LoadingState());
      File image = File(file!.path);
      var name = basename(file!.path);
      var refStorage = FirebaseStorage.instance.ref(name);
      await refStorage.putFile(image);
      var url = await refStorage.getDownloadURL();
      emit(SuccessState());
      return {
        "title": title,
        "numOfPage": numOfPage,
        "image": url,
        "price": price
      };
    } catch (e) {
      emit(FailedState());
      return {};
    }
  }
}
