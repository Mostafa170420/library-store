import 'package:cloud_firestore/cloud_firestore.dart';

class NoteBook {
  late String id;
  late String title;
  late String numOfPage;
  late String image;
  late String price;
  NoteBook(Map<String, dynamic> map, this.id) {
    title = map["title"];
    numOfPage = map["numOfPage"];
    image = map["image"];
    price = map["price"];
  }
  NoteBook.fromFirebase(DocumentSnapshot doc) {
    var data = doc.data() as Map;
    id = doc.id;
    title = data["title"];
    numOfPage = data["numOfPage"];
    image = data["image"];
    price = data["price"];
  }
}
