import 'dart:io';

import 'package:barokah_cars_project/app/modules/add_car/controllers/add_car_controller.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/home_header.dart';
import 'package:barokah_cars_project/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';

class AddCarWidget extends StatelessWidget {
  const AddCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addCarController = Get.put(AddCarController());
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (() => Get.back()), 
                      icon: const Icon(FluentIcons.arrow_left_20_regular, size: 30, color: Color(0xFFE82027),)
                    ),
                    const SizedBox(width: 16,),
                    const BaroHomeHeader(),
                  ],
                ),
                const SizedBox(height: 36,),
                Text("Add New Car", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black)),),
                const SizedBox(height: 30,),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // -- Merk

                      Text("Merk", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: addCarController.merkController,
                        validator: (value) => BaroValidator.emailValidate(value),
                        decoration: InputDecoration(
                          hintText: "Contoh: Lexus",
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelText: "Merk",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Model

                      Text("Model", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.modelController,
                        validator: (value) => BaroValidator.modelValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: Ambulans',
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelText: "Model",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // --   Tahun Pembuatan

                      Text("Tahun Pembuatan", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.tahunPembuatanController,
                        validator: (value) => BaroValidator.tahunPembuatanValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 2034',
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelText: "Tahun Pembuatan",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Kondisi
                      Text("Kondisi", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF6F6F6),
                        ),
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: addCarController.kondisiValue.value,
                            onChanged: (newValue) {
                              addCarController.kondisiValue.value = newValue!;
                            },
                            items: ['Baru', 'Bekas'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          ),
                        ),
                      ),

                      const SizedBox(height: 16,),

                      // -- Bahan Bakar
                      Text("Bahan Bakar", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF6F6F6),
                        ),
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: addCarController.bahanBakarValue.value,
                            onChanged: (newValue) {
                              addCarController.bahanBakarValue.value = newValue!;
                            },
                            items: ['Bensin (Gasoline)', 'Solar (Diesel)', 'Gas alam (CNG)', 'Listrik (Electricity)'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Transmisi

                      Text("Transmisi", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF6F6F6),
                        ),
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: addCarController.transmisiValue.value,
                            onChanged: (newValue) {
                              addCarController.transmisiValue.value = newValue!;
                            },
                            items: ['Manual', 'Matic'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // --   Warna

                      Text("Warna", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.warnaController,
                        validator: (value) => BaroValidator.warnaValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: Merah',
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelText: "Warna",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Harga Jual

                      Text("Harga Jual", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.hargaJualController,
                        validator: (value) => BaroValidator.hargaJualValidate(value),
                        decoration: InputDecoration(
                          labelText: "Harga Jual",
                          hintText: 'Contoh: 300.000.000',
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Contact Person
                      Text("Narahubung", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.narahubungController,
                        validator: (value) => BaroValidator.narahubungValidation(value),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 082248696800',
                          hintStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          labelText: "Kontak Whatsapp",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 16,),

                      // -- Deskripsi

                      Text("Deskripsi Tambahan", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: addCarController.deskripsiController,
                        validator: (value) => BaroValidator.deskripsiValidation(value),
                        decoration: InputDecoration(
                          hintText: "Jika tidak ada cukup isi dengan '-'",
                          labelText: "Deskripsi Tambahan",
                          labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027))
                          )
                        ),
                      ),
                      const SizedBox(height: 60,),

                      // -- Button Add
                      BaroWidgetButton(
                        buttonName: "Tambahkan Mobil", 
                        onPressed: () async {
                          String id = randomAlphaNumeric(10);
                          Map<String, dynamic> carInfoMap={
                            "Id": id,
                            "Merk": addCarController.merkController.text,
                            "Model": addCarController.modelController.text,
                            "Bahan Bakar": addCarController.bahanBakarValue.value,
                            "Transmisi": addCarController.transmisiValue.value,
                            "Kondisi": addCarController.kondisiValue.value,
                            "Harga Jual": addCarController.hargaJualController.text,
                            "Narahubung": addCarController.narahubungController.text,
                            "Deskripsi": addCarController.deskripsiController.text,
                            "Tahun Pembuatan": addCarController.tahunPembuatanController.text,
                            "Warna": addCarController.warnaController.text,
                          };
                          await addCarController.addCarDetails(carInfoMap, id).then((value) {
                            Get.dialog(
                              const Center(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE92027),),
                                    strokeWidth: 5,
                                  ),
                                ),
                              ),
                              barrierDismissible: false,
                            );
                          });
                          

                      await Future.delayed(const Duration(seconds: 2));

                      addCarController.clearForm();

                      Get.to(
                        () => const NavigationBarView(),
                        transition: Transition.fadeIn,
                        duration: const Duration(seconds: 1),
                      );
                      Get.snackbar('Add Cars Success', 'Mobil anda telah berhasil ditambahkan.', colorText: Colors.white, backgroundColor: const Color(0xFFE82027),);
                        }
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}