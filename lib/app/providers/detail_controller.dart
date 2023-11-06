import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final RxMap<String, dynamic> data = <String, dynamic>{}.obs;

  Stream<Map<String, dynamic>> get dataStream =>
      data.stream; // Definisi getter dataStream

  // Fungsi untuk mengambil data dari Firestore berdasarkan documentId
  Future<void> fetchData(String documentId) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection('images')
          .doc(documentId)
          .get();
      if (document.exists) {
        data.value = document.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // Fungsi untuk mengedit data pada Firestore
  Future<void> editData(String documentId, Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection('images')
          .doc(documentId)
          .update(newData);
      data.value = newData; // Update data lokal
    } catch (e) {
      print("Error updating data: $e");
    }
  }
}
