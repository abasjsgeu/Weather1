import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:wether_app_final/Features/home/presention/manger/SunController.dart';

class SunPathChart extends StatelessWidget {
  final BoxConstraints constraints;

  const SunPathChart({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final radius = 117; // 40% من العرض المتاح
    final centerX = constraints.maxWidth / 2.2; // مركز أفقي
    final centerY = constraints.maxHeight * 0.1; // مركز رأسي من الأسفل

    return GetX<SunController>(builder: (controller) {
      return Stack(children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1),
          left: centerX + radius * math.cos(controller.currentAngle.value),
          bottom: centerY - radius * math.sin(controller.currentAngle.value),
          child: const Icon(Icons.circle, color: Colors.amber, size: 24),
        ),
      ]);
    });
  }
}
