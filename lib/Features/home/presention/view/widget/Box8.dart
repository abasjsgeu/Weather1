import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/HalfCircleLineChart.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box8 extends StatelessWidget {
  const Box8({super.key});

  @override
  Widget build(BuildContext context) {
    return Backgrond_Box(
      height_box: 250,
      Box: Stack(
        children: [
          HalfCircleLineChart(),
          const Positioned(
            bottom: 2,
            left: 23,
            child: DottedLine(
              dashGapLength: 0,
              dashColor: const Color.fromARGB(110, 255, 255, 255),
              lineLength: 352,
            ),
          ),
        ],
      ),
    );
  }
}
