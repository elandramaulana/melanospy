import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melanospy/app/view/login_view.dart';

import '../models/users.dart';
import '../providers/auth_controller.dart';
import '../util/styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // final AuthController authController = AuthController.to;
  final authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _spesialisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: size.height / 7,
              left: size.height / 25,
              right: size.height / 25,
              bottom: size.height / 7),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create Your Account",
                  style: TextStyle(fontFamily: 'FredokaOne', fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Name",
                  style: robotoRegular,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFil(
                controller: _namaController,
                validate: (String? value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dokter Spesialis",
                  style: robotoRegular,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFil(
                controller: _spesialisController,
                validate: (String? value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: robotoRegular,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFil(
                controller: _emailController,
                validate: (String? value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: robotoRegular,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFil(
                controller: _passwordController,
                validate: (String? value) {
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  textButton: "Register",
                  onPressed: () {
                    // authController.registerWithEmailAndPassword(context);

                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    String nama = _namaController.text.trim();
                    String spesialis = _spesialisController.text.trim();

                    UserModel userModel = UserModel(
                      uid: '', // uid tidak diperlukan di sini
                      nama: nama,
                      email: email,
                      timestamp: DateTime.now().toString(),
                      spesialis: spesialis,
                    );

                    authController.register(email, password, userModel);
                  }),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Already have an account?",
                      style: robotoRegular,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginView());
                    },
                    child: const Text(
                      "Login",
                      style: robotoRegular,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: size.height * 0.06,
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     style: OutlinedButton.styleFrom(
              //       side: BorderSide(
              //         color: HexColor("#2476AE"),
              //         width: 2.0,
              //       ),
              //     ),
              //     child: Image.asset("assets/icon/facebook.png"),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   height: size.height * 0.06,
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     style: OutlinedButton.styleFrom(
              //       side: BorderSide(
              //         color: HexColor("#2476AE"),
              //         width: 2.0,
              //       ),
              //     ),
              //     child: Image.asset("assets/icon/google.png"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
