import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Item_Allergy.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box7 extends StatelessWidget {
  const Box7({super.key});

  @override
  Widget build(BuildContext context) {
    return const Backgrond_Box(
      height_box: null,
      Box: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Item_Allergy(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedLine(
                dashColor: const Color.fromARGB(110, 255, 255, 255),
                lineLength: 402,
              ),
            ),
            Item_Allergy(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedLine(
                dashColor: const Color.fromARGB(110, 255, 255, 255),
                lineLength: 402,
              ),
            ),
            Item_Allergy(),
          ],
        ),
      ),
    );
  }
}
