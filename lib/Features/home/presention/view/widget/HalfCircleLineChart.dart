import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wether_app_final/Features/home/presention/manger/SunController.dart';
import 'package:wether_app_final/Features/home/presention/view/SunPathChart.dart';

class HalfCircleLineChart extends StatelessWidget {
  HalfCircleLineChart({
    super.key,
  });
  final SunController controller = Get.find<SunController>();
  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        dashArray: [1, 2],

        belowBarData: BarAreaData(
          show: false,
          color: const Color.fromARGB(255, 186, 209, 194),
          spotsLine: BarAreaSpotsLine(
            show: false,
          ),
        ),
        spots: controller.generateChartPoin2ts(),
        isCurved: true,
        color: const Color.fromARGB(255, 193, 205, 194),
        barWidth: 1,
        shadow: Shadow(
            blurRadius: 8,
            color: const Color.fromARGB(8, 255, 153, 0).withOpacity(0.3)),
        // belowLineData: BarAreaData(show: false),
        dotData: FlDotData(show: false),
      ),
    ];

//
//
//

    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Half_CircleLine_Chart(lineBarsData),
          SunPathChart(constraints: constraints), // ← أرسل القيود
        ],
      ),
    );
  }

  LineChart Half_CircleLine_Chart(List<LineChartBarData> lineBarsData) {
    return LineChart(
      LineChartData(
        minX: -160,
        maxX: 165,
        minY: -6,
        maxY: 180,
        lineBarsData: lineBarsData,
        titlesData: _buildTitles(),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  FlTitlesData _buildTitles() {
    return FlTitlesData(
      bottomTitles: AxisTitles(drawBelowEverything: false),
      leftTitles: AxisTitles(drawBelowEverything: false),
      rightTitles: AxisTitles(drawBelowEverything: false),
      topTitles: AxisTitles(drawBelowEverything: false),
    );
  }
}
//
