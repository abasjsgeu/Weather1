import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box3 extends StatefulWidget {
  const Box3({
    super.key,
  });

  @override
  State<Box3> createState() => _Box3State();
}

class _Box3State extends State<Box3> {
  List<FlSpot> get allSpots => const [
        FlSpot(1, 35),
        FlSpot(2, 38),
        FlSpot(3, 36),
        FlSpot(4, 37),
        FlSpot(5, 36),
        FlSpot(6, 34),
        FlSpot(7, 34),
        FlSpot(8, 35),
        FlSpot(9, 30),
        FlSpot(10, 30),
      ];
  List<FlSpot> get allSpots1 => const [
        FlSpot(1, 0),
        FlSpot(10, 0),
      ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 6, // حجم النقطة
            color: const Color.fromARGB(234, 3, 184, 235), // لون حدود النقطة

            strokeWidth: 2, // سمك حدود النقطة
            strokeColor: const Color.fromARGB(255, 221, 224, 227), // لون النقطة
          ),
        ),
        preventCurveOverShooting: true,

        isStepLineChart: false,
        isStrokeCapRound: false,
        // showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        barWidth: 2,
        // shadow: const Shadow(
        //   blurRadius: 3,
        // ),
        // strokeWidth: 2,

        belowBarData: BarAreaData(
          color: const Color.fromARGB(0, 214, 175, 175),
          spotsLine: BarAreaSpotsLine(
              show: true,
              applyCutOffY: false,
              flLineStyle: FlLine(
                strokeWidth: 1,
                dashArray: [4, 2],
                color: const Color.fromARGB(173, 206, 199, 199),
              )),
          show: true,
        ),
        // dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        dotData: FlDotData(
          show: false,
        ),
        preventCurveOverShooting: false,
        color: const Color.fromARGB(255, 245, 244, 245),
        isStepLineChart: false,
        isStrokeCapRound: true,
        // showingIndicators: showingTooltipOnSpots,
        spots: allSpots1,
        isCurved: false,
        barWidth: 1,

        dashArray: [6, 4],

        // dotData: const FlDotData(show: false),

        // stops: const [0.1, 0.4, 1.9],
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final minX = allSpots.map((s) => s.x).reduce((a, b) => a < b ? a : b);
        final maxX = allSpots.map((s) => s.x).reduce((a, b) => a > b ? a : b);
        final minY = allSpots
            .map((s) => s.y)
            .reduce((a, b) => a < b ? a + 1.5 : b - 16.9);
        final maxY = allSpots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
        final xRange = (maxX - minX) == 0 ? 1.0 : (maxX - minX);
        final yRange = (maxY - minY) == 0 ? 1.0 : (maxY - minY);

        // حساب المدى مع تفادي القسمة على الصفر
        // final xRange = (maxX - minX) == 0 ? 1.0 : (maxX + minX) + 1;
        // final yRange = (maxY - minY) == 0 ? 1.0 : (maxY + minY + 1.1);

        return Backgrond_Box(
          height_box: 350,
          Box: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: (maxX - minX) * 50 + 100, // تحديد عرض أساسي
                child: Stack(
                  children: [
                    // ...List_Sunny_time(minY, maxY, minX, xRange, maxX, context),
                    //
                    ...Number_ON_Chart(minY, maxY, minX, xRange, maxX).toList(),

                    Chart_Line(maxX, minX, maxY, yRange, lineBarsData),
                    //
                    //
                    ...List_Of_Icon_Down(minY, maxY, minX, xRange, maxX)
                        .toList(),

                    //
                  ],
                ),
              )),
        );
      },
    );
  }

  Iterable<Positioned> Number_ON_Chart(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots.map((spot) {
      final text = '${spot.x.toStringAsFixed(0)}'; // رقم عشري واحد بدون رمز

      final normalizedY = (spot.y - minY) / (maxY - minY);

      final xPos = ((spot.x - minX) / xRange) * (maxX + 21 - minX - 16) * 37;
      final yPos = spot.y <= 12
          ? (1 - normalizedY) * maxY
          : (1 - normalizedY) * maxY + 38;

      return Positioned(
        left: xPos + 6, // تعديل لمركزة النص
        top: yPos, // وضع النص أعلى النقطة
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

//
  Iterable<Positioned> List_Of_Icon_Down(
      double minY, double maxY, double minX, double xRange, double maxX) {
    List<String> List_of_day = const [
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
      "Mon",
      "Wed",
      "Wed",
      "ANA",
      "Wed",
      "ANA",
    ];
    return allSpots.map((spot) {
      final text = '${spot.y.toStringAsFixed(1)}°'; // رقم عشري واحد بدون رمز

      final normalizedY = (spot.y - minY) / (maxY - minY + 5);

      final xPos = ((spot.x - minX) / xRange) * (maxX + 21.8 - minX - 16) * 34;
      final yPos = spot.y <= 12
          ? (1 - normalizedY) * maxY + 58
          : (1 - normalizedY) * maxY + 53;

      return Positioned(
        left: xPos, // تعديل لمركزة النص
        bottom: 15,
        // width: 90,
        child: Column(
          children: [
            Text(List_of_day[spot.x.toInt()],
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(
              height: 5,
            ),
            const Icon(Icons.wb_sunny_outlined,
                color: const Color.fromARGB(255, 231, 228, 219), size: 27),
            const SizedBox(
              height: 10,
            ),
            Text(List_of_day[spot.x.toInt()],
                style: TextStyle(
                    color: const Color.fromARGB(122, 255, 255, 255),
                    fontSize: 15)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "20/0%",
              style: TextStyle(
                  color: const Color.fromARGB(110, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }

  Positioned Chart_Line(double maxX, double minX, double maxY, double yRange,
      List<LineChartBarData> lineBarsData) {
    return Positioned(
      bottom: 130,
      right: 3.5,
      child: SizedBox(
        height: 430,
        width: (maxX - minX) * 59.6, // يتناسب مع نطاق البيانات
        child: LineChart(
          LineChartData(
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(),
            minX: minX - .2,
            maxX: maxX + .3,
            minY: -1,
            maxY: maxY + (yRange * 9.1),
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(show: false),

            gridData: FlGridData(
              show: true,
              drawHorizontalLine: false,
              checkToShowHorizontalLine: (value) {
                final guideLines = [0.0, 19.0, 34.0]; // قيم الإرشادات
                return guideLines.contains(value);
              },
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.white.withOpacity(0.7),
                strokeWidth: 1,
                dashArray: [5, 3],
              ),
              checkToShowVerticalLine: (value) =>
                  [0.0, 0.0, 0.0].contains(value),
              getDrawingVerticalLine: (value) => FlLine(
                color: const Color.fromARGB(242, 5, 235, 63).withOpacity(0.5),
                strokeWidth: 5,
                dashArray: [2, 1],
              ),
              drawVerticalLine: false,
            ),
            // clipData: FlClipData.all(),

            lineBarsData: lineBarsData,
            // ... بقية إعدادات الرسم البياني
          ),
        ),
      ),
    );
  }
}
