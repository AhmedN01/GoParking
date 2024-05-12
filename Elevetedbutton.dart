
import 'package:flutter/material.dart';

class RoundeButton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Image? image;
  final Color? bgColor;
  final ButtonStyle? styale;
  final TextStyle? textStyle;
  final VoidCallback? callBack;


  const RoundeButton({
      required this.btnName,
      this.icon,
      this.image,
      this.bgColor,
      this.textStyle,
      required this.callBack,
      this.styale});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 52,
      padding:  const EdgeInsets.fromLTRB(10, 0, 10, 0),

    );
  }
}
