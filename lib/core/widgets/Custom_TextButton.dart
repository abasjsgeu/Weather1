import 'package:flutter/material.dart';

class CustomTextbutton extends StatelessWidget {
  const CustomTextbutton({super.key, this.widget, this.onpressed});
  final Widget? widget;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: style_Button(),
      child: widget!,
    );
  }
}

ButtonStyle style_Button() {
  return OutlinedButton.styleFrom(
    padding: EdgeInsets.zero, // ← إزالة الهوامش الداخلية

    // شكل الزوايا
    side: BorderSide.none,
    shape: RoundedRectangleBorder(
      // شكل الزوايا
      borderRadius: BorderRadius.circular(1),
    ),
  );
}
