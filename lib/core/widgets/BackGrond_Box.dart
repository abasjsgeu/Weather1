import 'package:flutter/material.dart';

class Backgrond_Box extends StatelessWidget {
  const Backgrond_Box({
    super.key,
    required this.Box,
    this.height_box,
  });
  final Widget Box;
  final double? height_box;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height_box,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(112, 2, 3, 0),
            border: Border.all(color: Colors.white, width: 0.05)),
        child: Box);
  }
}
