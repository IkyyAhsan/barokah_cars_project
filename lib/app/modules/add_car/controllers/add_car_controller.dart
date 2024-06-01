import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddCarController extends GetxController {
  final TextEditingController merkController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController hargaJualController = TextEditingController();
  final TextEditingController narahubungController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunPembuatanController = TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  var bahanBakarValue = 'Bensin (Gasoline)'.obs;
  var transmisiValue = 'Manual'.obs;
  var kondisiValue = 'Baru'.obs;
  RxString imageUrl = ''.obs;
  
  void clearForm(){
    merkController.clear();
    modelController.clear();
    hargaJualController.clear();
    narahubungController.clear();
    deskripsiController.clear();
    tahunPembuatanController.clear();
    warnaController.clear();
    bahanBakarValue.value = 'Bensin (Gasoline)';
    transmisiValue.value = 'Manual';
    kondisiValue.value = 'Baru';
  }

  Future addCarDetails(
    Map<String, dynamic> carInfoMap, String id) async {
      return await FirebaseFirestore.instance
      .collection("cars")
      .doc(id)
      .set(carInfoMap);
    }

  // Metode untuk mengunggah gambar
  Future<void> uploadImage(File image) async {
    try {
      // Mendapatkan referensi penyimpanan di Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('car_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Mengunggah gambar ke Firebase Storage
      await ref.putFile(image);

      // Mendapatkan URL gambar yang diunggah
      String downloadURL = await ref.getDownloadURL();

      // Menyimpan URL gambar ke variabel imageUrl
      imageUrl.value = downloadURL;
    } catch (e) {
      print(e.toString());
    }
  }

}
