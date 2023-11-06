import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../util/styles.dart';

// ignore: must_be_immutable
class CustomTextFil extends StatelessWidget {
  CustomTextFil({
    this.hintText,
    this.labelText,
    this.obscureText,
    required this.validate,
    this.keyboardType,
    super.key,
    this.onChanged,
    this.controller,
  });

  String? hintText;
  String? labelText;
  bool? obscureText;
  TextInputType? keyboardType;
  FormFieldValidator<String>? validate;
  void Function(String)? onChanged;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validate,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: robotoBold.copyWith(
              color: Theme.of(context).secondaryHeaderColor),
          hintText: hintText,
          hintStyle: robotoMedium.copyWith(
              color: Theme.of(context).secondaryHeaderColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: HexColor("#207198"), width: 1.8),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}
