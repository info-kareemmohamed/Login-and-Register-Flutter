import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class Mainbutton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;
  const Mainbutton({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50.0,
          width: 500,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(10.27),
          ),
          child: Center(
            child: Text(text,
                style: AppTextStyle.medium(
                  color: txtColor,
                  fontSize: 14.12,
                )),
          )),
    );
  }
}
