import 'package:barokah_cars_project/app/modules/car_news/controllers/car_news_controller.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/home_header.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/search_bar_screen.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CarNewsView extends GetView<CarNewsController> {
  CarNewsView({super.key});
  
  final databaseRef = FirebaseDatabase.instance.ref().child('cars');
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarNewsController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BaroHomeHeader(),
                const SizedBox(height: 30,),
                Text(BaroTexts.carNewsTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D))),),
                const SizedBox(height: 4,),
                Text(BaroTexts.carNewsSubtitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 320,
                      child: Stack(
                        children: [
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1)
                                )
                              ]
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                const Icon(
                                  FluentIcons.search_20_regular,
                                  color: Colors.black45,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    onChanged: controller.filterCars,
                                    decoration: const InputDecoration(
                                      hintText: 'Search',
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red
                        ),
                        child: const Icon(FluentIcons.filter_20_regular, size: 32, color: Colors.white,),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            )
            ),
        ),
      ),
    );
  }
}
