import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:melanospy/app/view/home_view.dart';
import 'package:melanospy/app/view/login_view.dart';

import 'app/providers/auth_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      color: HexColor('114773'),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/home',
            page: () =>
                const HomeView()), // Ganti HomePage dengan widget beranda yang sesuai
      ],
      home: LoginView(),
    );
  }
}
