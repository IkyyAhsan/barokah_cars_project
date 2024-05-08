// Menyimpan seluruh teks yang dibutuhkan

import 'package:barokah_cars_project/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class BaroTexts {
  final controller = Get.put(LoginController());

  // -- Authentication Heading
  static const String loginTitle = 'Selamat Datang!';
  static const String registerTitle = 'Buat Akun';
  static const String loginDesc = 'Silahkan masuk untuk memulai.';
  static const String registerDesc = 'Silahkan mengisi form berikut dengan benar.';

  // -- Authentication Form
  static const String email = 'Email';
  static const String nameRegister = 'Nama';
  static const String password = 'Password';
  static const String confirmPasswordRegister = 'Konfirmasi Password';
  static const String forgetPassword = 'Lupa password?';
  static const String login = 'Masuk';
  static const String register = 'Daftar';
  static const String or = 'Atau';
  static const String dontHaveAccount = 'Belum memiliki akun?';
  static const String registerHere = 'Daftar disini';
  static const String continueWithGoogle = 'Lanjutkan dengan Google';

  // -- OnBoarding Texts
  static const String onBoardingTitle1 = "Pilih produk Anda";
  static const String onBoardingTitle2 = "Update Event Mobil";
  static const String onBoardingTitle3 = "Kemudahan Berbelanja";

  static const String onBoardingSubtitle1 = "Selamat Datang di Barokah Cars, tempat anda menemukan gaya mobil populer anda";
  static const String onBoardingSubtitle2 = "Sumber terpercaya dan update terkini seputar event dan perkembangan mobil";
  static const String onBoardingSubtitle3 = "Pilihan terbaik untuk menemukan pengalaman belanja mobil yang mudah dan lengkap bagi pembeli dan penjual";

  static const String buttonTitle = "Selanjutnya";
  static const String lastButtonTitle = "Mulai Sekarang";
}