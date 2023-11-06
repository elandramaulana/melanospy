import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../util/dimensions.dart';
import '../util/styles.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String textButton;

  const CustomButton(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: HexColor("#2476AE"),
        ),
        onPressed: onPressed as void Function(),
        child: Text(
          textButton,
          style: fredokaoneoRegular.copyWith(
            fontSize: Dimensions.FONT_SIZE_NORMAL,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
