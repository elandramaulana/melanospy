import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:melanospy/app/providers/auth_controller.dart';
import 'package:melanospy/app/util/styles.dart';
import 'package:melanospy/app/view/home_view.dart';
import 'package:melanospy/app/view/register_view.dart';
import 'package:melanospy/app/widgets/custom_button.dart';

import '../widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final authController = AuthController();

  void _onLoginButtonPressed() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    await authController.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                  color: HexColor('2476AE'),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50))),
              child: Stack(children: [
                Positioned(
                    top: 80,
                    left: 0,
                    child: Container(
                      height: 80,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    )),
                const Positioned(
                  top: 97,
                  left: 100,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(fontFamily: 'FredokaOne', fontSize: 35),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: robotoRegular,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: CustomTextFil(
                validate: (String? value) {
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: robotoRegular,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: CustomTextFil(
                validate: (String? value) {
                  return null;
                },
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: CustomButton(
                  textButton: "Login",
                  onPressed: () {
                    // _onLoginButtonPressed();
                    Get.to(HomeView());
                  }),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password",
                    style: robotoRegular,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 50,
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Don't have an account?",
                      style: robotoRegular,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const RegisterView());
                  },
                  child: const Text(
                    "Create Now",
                    style: robotoRegular,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
