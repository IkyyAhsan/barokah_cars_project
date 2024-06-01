import 'package:barokah_cars_project/app/modules/login/views/login_view.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/edit_profile.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/profile_features.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileScreenController profileController = Get.put(ProfileScreenController());

    // Panggil fetchUserData di sini
    profileController.fetchUserData();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFE92027),
        title: Text(
          "Profile Saya",
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                color: const Color(0xFFE92027),
              ),
              Positioned(
                top: 85 - 52,
                child: Container(
                  width: 390,
                  height: 78,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        offset: const Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage: profileController.profileImageUrl.isNotEmpty
                            ? NetworkImage(profileController.profileImageUrl.value)
                            : null,
                        child: profileController.profileImageUrl.isEmpty
                            ? const Icon(
                          FluentIcons.person_20_regular,
                          color: Colors.white,
                        )
                            : null,
                      ),
                      const SizedBox(width: 16,),

                      // Menampilkan User Data From Firestore
                      Obx(
                          () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileController.name.value,
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF232323))),
                            ),
                            Text(
                              profileController.email.value,
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF80869A))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // -- First Fiturs
                BaroProfileFeatures(
                  fiturIcon: FluentIcons.text_bullet_list_square_edit_20_regular,
                  fiturName: "Informasi Pribadi",
                  onTap: () => Get.to(() => const BaroEditProfile()),
                ),
                const SizedBox(height: 40,),

                // -- Second Fiturs
                GestureDetector(
                  onTap: () async {
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

                    await Future.delayed(const Duration(seconds: 2));
                    Get.offAll(
                      () => LoginView(),
                      transition: Transition.fadeIn,
                      duration: const Duration(seconds: 1),
                    );
                    Get.snackbar("Logout Berhasil", "Terima kasih atas kepercayaan anda menggunakan BaroCars.", backgroundColor: Color(0xFFE92027), colorText: Colors.white);
                  },
                  child: Row(
                    children: [
                      const Icon(FluentIcons.sign_out_20_regular, color: Color(0xFFE92027),),
                      const SizedBox(width: 8,),
                      Text("Keluar", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFE92027))),),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
