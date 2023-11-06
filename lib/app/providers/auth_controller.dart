import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:melanospy/app/view/login_view.dart';
import '../models/users.dart';

import '../view/home_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isLoggedIn = false.obs;

  Future<void> register(
      String email, String password, UserModel userModel) async {
    try {
      // Mendaftarkan pengguna menggunakan Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid; // Generate unique uid
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'nama': userModel.nama,
          'email': userModel.email,
          'timestamp': userModel.timestamp,
          'spesialis': userModel.spesialis,
        });
        Get.offAll(HomeView());
        isLoggedIn.value = false;
      }

      // Pemanggilan Get.snackbar setelah berhasil mendaftar dan data disimpan
      Get.snackbar('Registrasi Berhasil', 'Akun Anda telah berhasil dibuat.',
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      print('Error during registration: $e');
      // Penanganan kesalahan jika mendaftar atau menyimpan data gagal
      Get.snackbar('Registrasi Gagal', 'Terjadi kesalahan saat mendaftar: $e',
          snackPosition: SnackPosition.TOP);
    }
  }

  // Fungsi untuk login user
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Login Berhasil', 'Anda berhasil masuk.',
          snackPosition: SnackPosition.TOP);
      Get.offAll(const HomeView());
      isLoggedIn.value = true;
    } catch (e) {
      // Tangani pesan kesalahan dengan lebih baik
      String errorMessage = "Terjadi kesalahan saat mencoba masuk.";

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            errorMessage = "Email tidak valid.";
            break;
          case 'user-not-found':
          case 'wrong-password':
            errorMessage = "Email atau kata sandi salah.";
            break;
          default:
            errorMessage = "Terjadi kesalahan saat mencoba masuk.";
        }
      }

      print(errorMessage); // Cetak pesan kesalahan ke konsol untuk debugging.

      Get.snackbar('Login Gagal', errorMessage,
          snackPosition: SnackPosition.TOP);
    }
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    isLoggedIn.value = false;
    await _auth.signOut();
  }

  Rx<User>? get user => _auth.currentUser?.obs;

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginView());
    } catch (e) {
      // Handle logout error
      print('Logout error: $e');
    }
  }
}
