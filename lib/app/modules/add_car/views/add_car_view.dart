import 'package:barokah_cars_project/app/modules/add_car/controllers/add_car_controller.dart';
import 'package:barokah_cars_project/app/modules/add_car/views/widgets/added_a_car.dart';
import 'package:barokah_cars_project/app/modules/add_car/views/widgets/show_data.dart';
import 'package:barokah_cars_project/app/modules/car_news/controllers/car_news_controller.dart';
import 'package:barokah_cars_project/app/modules/home/views/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCarView extends GetView<CarNewsController> {
  const AddCarView({super.key});
  
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const BaroHomeHeader(),
                const SizedBox(height: 36,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your List Cars", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black)),),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCarWidget())),
                      child: Container(
                        width: 75,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFE82027)
                        ),
                        child: Text("Add Cars", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))),),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: Colors.black, 
                        thickness: 0.5, 
                        indent: 5, 
                        endIndent: 5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),


                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    int firstIndex = index * 2;
                    int secondIndex = firstIndex + 1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: Container(
                                width: 180,
                                height: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFE82027),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Ini Contoh $firstIndex",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: Container(
                                width: 180,
                                height: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFE82027),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Ini Contoh $secondIndex",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}