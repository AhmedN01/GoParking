
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final bool? showPassword;
  final String? labelText;
  final Function(String?)? validator;
  final TextStyle? textStyle;
  final bool? obscureText;
  final Widget? suffixIcon;
  final int? maxLength;
  final String Function(String)? onchange;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;

  const CommonTextField(
      {Key? key,
      this.showPassword,
      this.hintText,
      this.textEditingController,
      this.textStyle,
      this.labelText,
      this.suffixIcon,
      this.obscureText,
      this.onchange,
      this.textInputType,
      this.maxLength, this.validator,})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
        // child:  SizedBox(
        //   width: 300,
        //   child: TextField(
        //     style: TextStyle(color: Color(0xff2378EF), fontSize: 14),
        //     decoration: InputDecoration(
        //         labelText: labelText,
        //         labelStyle: TextStyle(color: Color(0xff75788D)),
        //     ),
        //   ),
        // ),
        SizedBox(
      width: 300,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],

        onChanged: onchange,
        obscureText: showPassword ?? false,
        style:textStyle ,
        controller: textEditingController,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.grey),
            ),
            // contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xff75788D)),
            //============icon==============
            suffixIcon: suffixIcon,
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
