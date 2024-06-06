import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:intl/intl.dart';

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
  ImagePicker image = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  void clearForm() {
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
    selectedImage.value = null;
  }

  Future<void> addCarDetails(Map<String, dynamic> carInfoMap, String id) async {
    DatabaseReference databaseReferences =
        FirebaseDatabase.instance.ref().child('cars').child(randomString(19));
    try {
      await databaseReferences.set(carInfoMap);
      print('Mobil berhasil ditambahkan');
    } catch (e) {
      print('Terjadi kesalahan, idak dapat menambahkan mobil');
    }
  }

  // Metode untuk mengunggah gambar
  Future<void> uploadImage(File image) async {
    try {
      // Mendapatkan referensi penyimpanan di Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('cars')
          .child('/${DateTime.now().millisecondsSinceEpoch}.jpg');

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

  Future<void> getImage() async {
    final XFile? img = await image.pickImage(source: ImageSource.gallery);
    if (img != null) {
      selectedImage.value = File(img.path);
    }
  }

  Future<void> uploadFile() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? emailPenjual = user?.email;
    if (selectedImage.value != null) {
      try {
        var imagefile = FirebaseStorage.instance
            .ref()
            .child("Images")
            .child("/${randomString(13)}.jpg");
        UploadTask task = imagefile.putFile(selectedImage.value!);
        TaskSnapshot snapshot = await task;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrl.value = downloadUrl;

        if (imageUrl.value.isNotEmpty) {
          String formattedTimestamp =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          Map<String, String> contact = {
            'merk': merkController.text,
            'model': modelController.text,
            'bahan_bakar': bahanBakarValue.value,
            'transmisi': transmisiValue.value,
            'kondisi': kondisiValue.value,
            'harga': hargaJualController.text,
            'kontak_penjual': narahubungController.text,
            'deskripsi': deskripsiController.text,
            'tahun_pembuatan': tahunPembuatanController.text,
            'warna': warnaController.text,
            'image': imageUrl.value,
            'upload_timestamp': formattedTimestamp,
            'email_penjual': emailPenjual!,
            // Add other fields as necessary
          };

          DatabaseReference dbRef =
              FirebaseDatabase.instance.ref().child('cars');
          await dbRef.push().set(contact);
        }
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  Widget _buildDropdownRow(String label, String value, List<String> options, Function(String) onUpdate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          ':',
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: (newValue) {
              if (newValue != null) {
                onUpdate(newValue);
              }
            },
            items: options.map<DropdownMenuItem<String>>((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option, style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                )),
              );
            }).toList(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void initializeWithCarData(Map<String, dynamic> car) {
    merkController.text = car['merk'] ?? '';
    modelController.text = car['model'] ?? '';
    tahunPembuatanController.text = car['tahun_pembuatan'] ?? '';
    warnaController.text = car['warna'] ?? '';
    bahanBakarValue.value = car['bahan_bakar'] ?? 'Bensin (Gasoline)';
    transmisiValue.value = car['transmisi'] ?? 'Manual';
    kondisiValue.value = car['kondisi'] ?? 'Baru';
    hargaJualController.text = car['harga'] ?? '';
    narahubungController.text = car['kontak_penjual'] ?? '';
    deskripsiController.text = car['deskripsi'] ?? '';
    imageUrl.value = car['image'] ?? '';
  }

  Future<void> updateCarDetails(String carId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('cars').child(carId);
    Map<String, dynamic> updatedCarData = {
      'merk': merkController.text,
      'model': modelController.text,
      'tahun_pembuatan': tahunPembuatanController.text,
      'warna': warnaController.text,
      'bahan_bakar': bahanBakarValue.value,
      'transmisi': transmisiValue.value,
      'kondisi': kondisiValue.value,
      'harga': hargaJualController.text,
      'kontak_penjual': narahubungController.text,
      'deskripsi': deskripsiController.text,
      'image': imageUrl.value,
    };

    try {
      await databaseReference.update(updatedCarData);
      print('Data mobil berhasil diperbarui');
    } catch (e) {
      print('Terjadi kesalahan, tidak dapat memperbarui data mobil: $e');
    }
  }

  Future<void> deleteCar(String carId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('cars').child(carId);
    try {
      await databaseReference.remove();
      print('Mobil berhasil dihapus');
    } catch (e) {
      print('Terjadi kesalahan, tidak dapat menghapus mobil: $e');
    }
  }
}