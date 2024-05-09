import 'package:flutter/material.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';

class CustomeTextField extends StatelessWidget{
  const CustomeTextField({super.key,
    this.keyboardType,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle,
    required this.controller,
    this.onChange});


  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth*0.9,
      decoration: BoxDecoration(
        color: AppConst.kLight,

        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),

      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChange,
        style: appstyle(16, AppConst.kBkDrark, FontWeight.normal),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kBkDrark,
          hintStyle: hintStyle,

          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kRed, width: 0.5)
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: 0.5)
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kRed, width: 0.5)
          ),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kGreyDk, width: 0.5)
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kBkDrark, width: 0.5)
          ),
        ),
      ),
    );
  }

}