import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<QueryDocumentSnapshot>> getDocs(String collectionId) async {
    try {
      var data = await firestore.collection(collectionId).get();
      return data.docs;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addDoc(
      String collectionId, String id, Map<String, dynamic> map) async {
    try {
      await firestore.collection(collectionId).doc(id).set(map);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteDoc(String collectionId, String id) async {
    try {
      await firestore.collection(collectionId).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDoc(
      String collectionId, String id, Map<String, dynamic> map) async {
    try {
      await firestore.collection(collectionId).doc(id).update(map);
    } catch (e) {
      rethrow;
    }
  }
}
