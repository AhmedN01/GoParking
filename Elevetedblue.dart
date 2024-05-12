// ignore_for_file: file_names
import 'package:flutter/material.dart';

class RoundeButtonblue extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final ButtonStyle? styale;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  const RoundeButtonblue(
      {super.key, required this.btnName,
      this.icon,
      this.bgColor,
      this.textStyle,
      required this.callBack,
      this.styale});

  @override
 Widget build(BuildContext context) {
  return Container(
    height: 52,
    width: 327,
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextButton(
      onPressed: callBack,
      style: styale,
      child: Text(
        btnName,
        style: textStyle,
      ),
    ),
  );
  }
}
