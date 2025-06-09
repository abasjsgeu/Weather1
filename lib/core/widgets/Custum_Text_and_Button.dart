import 'package:flutter/material.dart';

class Custom_TextAndButton_inHomePage extends StatelessWidget {
  const Custom_TextAndButton_inHomePage({
    super.key,
    required this.text,
    this.custom_icon,
  });
  final String? text;
  final IconData? custom_icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          custom_icon,
          color: Colors.white60,
        )
      ],
    );
  }
}
