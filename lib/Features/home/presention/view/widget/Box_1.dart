import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box1 extends StatefulWidget {
  const Box1({
    super.key,
    Color? gradientColor1,
    Color? gradientColor2,
    Color? gradientColor3,
    Color? indicatorStrokeColor,
  })  : gradientColor1 =
            gradientColor1 ?? const Color.fromARGB(255, 240, 248, 1),
        gradientColor2 =
            gradientColor2 ?? const Color.fromARGB(255, 240, 248, 1),
        gradientColor3 =
            gradientColor3 ?? const Color.fromARGB(255, 240, 248, 1),
        indicatorStrokeColor =
            indicatorStrokeColor ?? const Color.fromARGB(255, 255, 0, 0);

  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;
  final Color indicatorStrokeColor;

  @override
  State<Box1> createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<Box1> {
  List<FlSpot> get allSpots => const [
        FlSpot(1, 22),
        FlSpot(2, 25),
        FlSpot(3, 25),
        FlSpot(4, 26),
        FlSpot(5, 31),
        FlSpot(6, 31),
        FlSpot(7, 29),
        FlSpot(8, 29),
        FlSpot(9, 29),
        FlSpot(10, 29),
        FlSpot(11, 26),
        FlSpot(12, 27),
        FlSpot(13, 29),
        FlSpot(14, 30),
      ];
  List<FlSpot> get allSpots1 => const [
        FlSpot(1, 1),
        FlSpot(14, 0),
      ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 2, // حجم النقطة
            color: const Color.fromARGB(255, 221, 224, 227), // لون النقطة
            strokeWidth: 2, // سمك حدود النقطة
            strokeColor:
                const Color.fromARGB(62, 255, 255, 255), // لون حدود النقطة
          ),
        ),
        preventCurveOverShooting: true,

        isStepLineChart: false,
        isStrokeCapRound: false,
        // showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 2,
        // shadow: const Shadow(
        //   blurRadius: 3,
        // ),
        // strokeWidth: 2,

        belowBarData: BarAreaData(
          color: const Color.fromARGB(244, 230, 5, 5),
          spotsLine: BarAreaSpotsLine(
              show: true,
              applyCutOffY: false,
              flLineStyle: FlLine(
                strokeWidth: 1,
                dashArray: [4, 2],
                color: const Color.fromARGB(173, 206, 199, 199),
              )),
          show: true,
          gradient: LinearGradient(
            colors: [
              widget.gradientColor1.withValues(alpha: 0.1),
              widget.gradientColor2.withValues(alpha: 0.1),
              widget.gradientColor3.withValues(alpha: 0.1),
            ],
          ),
        ),
        // dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: [
            widget.gradientColor1,
            widget.gradientColor2,
            widget.gradientColor3,
          ],

          // stops: const [0.1, 0.4, 1.9],
        ),
      ),
      LineChartBarData(
        dotData: FlDotData(
          show: false,
        ),
        preventCurveOverShooting: false,
        color: Colors.purpleAccent,
        isStepLineChart: false,
        isStrokeCapRound: true,
        // showingIndicators: showingTooltipOnSpots,
        spots: allSpots1,
        isCurved: false,
        barWidth: 1,
        // shadow: const Shadow(
        //   blurRadius: 3,
        // ),
        // strokeWidth: 2,

        dashArray: [5, 3],
        belowBarData: BarAreaData(
          color: const Color.fromARGB(244, 197, 157, 157),
          spotsLine: BarAreaSpotsLine(
              show: true,
              applyCutOffY: false,
              flLineStyle: FlLine(
                strokeWidth: 1,
                dashArray: [5, 3],
                color: const Color.fromARGB(172, 199, 206, 199),
              )),
          show: false,
          gradient: LinearGradient(
            colors: [
              widget.gradientColor1.withValues(alpha: 0.1),
              widget.gradientColor2.withValues(alpha: 0.1),
              widget.gradientColor3.withValues(alpha: 0.1),
            ],
          ),
        ),
        // dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(172, 199, 206, 199),
            const Color.fromARGB(172, 199, 206, 199),
            const Color.fromARGB(172, 199, 206, 199)
          ],

          // stops: const [0.1, 0.4, 1.9],
        ),
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
          height_box: MediaQuery.of(context).size.height * .37,
          Box: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: (maxX - minX) * 42.4 + 100, // تحديد عرض أساسي
                child: Stack(
                  clipBehavior: Clip.hardEdge, // إضافة قص للعناصر الزائدة

                  children: [
                    ...List_Sunny_time(minY, maxY, minX, xRange, maxX, context),
                    //
                    Chart_Line(maxX, minX, maxY, yRange, lineBarsData),
                    //
                    ...Number_ON_Chart(minY, maxY, minX, xRange, maxX),

                    //

                    ...List_of_Icon_Umbrella(minY, maxY, minX, xRange, maxX)

                    //
                    ,
                    ...List_Of_TextBotton(minY, maxY, minX, xRange, maxX),
                    chance_Rain(),
                    Chance_of_snow(),
                  ],
                ),
              )),
        );
      },
    );
  }

  Iterable<Widget> List_Of_TextBotton(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots.map((spot) {
// رقم عشري واحد بدون رمز

      final xPos = ((spot.x - minX) / xRange) * (maxX + 20 - minX - 16) * 35;

      return Positioned(
          left: xPos + 5, // تعديل لمركزة النص
          bottom: 80, // وضع النص أعلى النقطة
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(0, 211, 160, 6),
                shadowColor: Colors.amber,

                minimumSize: Size(40, 204), // Add minimum size if needed
              ),
              onPressed: () {
                print("ASS");
              },
              child: const SizedBox()));
    });
  }

  Iterable<Widget> List_of_Icon_Umbrella(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots.map((spot) {
// رقم عشري واحد بدون رمز

      final xPos = ((spot.x - minX) / xRange) * (maxX - minX) * 46;

      return Positioned(
          left: xPos, // تعديل لمركزة النص
          bottom: 65, // وضع النص أعلى النقطة
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Icon(
                  Icons.access_time_rounded,
                  size: 13,
                  color: Color.fromARGB(98, 255, 255, 255),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "0%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ));
    });
  }

  Iterable<Positioned> Number_ON_Chart(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots.map((spot) {
      final text = '${spot.y.toStringAsFixed(1)}°'; // رقم عشري واحد بدون رمز

      final normalizedY = (spot.y - minY) / (maxY - minY + 5);

      final xPos = ((spot.x - minX) / xRange) * (maxX + 20 - minX - 16) * 36;
      final yPos = spot.y <= 12
          ? (1 - normalizedY) * maxY + 58
          : (1 - normalizedY) * maxY + 53;

      return Positioned(
        left: xPos + 4, // تعديل لمركزة النص
        top: yPos + 19, // وضع النص أعلى النقطة
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  Positioned Chart_Line(double maxX, double minX, double maxY, double yRange,
      List<LineChartBarData> lineBarsData) {
    return Positioned(
      bottom: 100,
      right: 3.5,
      child: SizedBox(
        height: 430,
        width: (maxX - minX) * 59.6, // يتناسب مع نطاق البيانات
        child: LineChart(
          LineChartData(
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(),
            minX: minX - 3.3,
            maxX: maxX + .6,
            minY: 1, // تم التعديل هنا
            maxY: maxY + (yRange * 19.1),
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

  Iterable<Widget> List_Sunny_time(double minY, double maxY, double minX,
      double xRange, double maxX, BuildContext context) {
    return allSpots.map((spot) {
// رقم عشري واحد بدون رمز

      final xPos = ((spot.x - minX) / xRange) * (maxX + 20 - minX - 16) * 36;

      return Positioned(
        left: xPos + 4, // تعديل لمركزة النص
        bottom: 240, // وضع النص أعلى النقطة
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 50.5,
            maxHeight: 200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${allSpots[1].x.toInt()}:00",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Icon(Icons.wb_sunny_outlined,
                  color: const Color.fromARGB(255, 231, 228, 219), size: 27),
            ],
          ),
        ),
      );
    });
  }
}

Positioned Chance_of_snow() {
  return Positioned(
    top: 220,
    left: 200,
    child: Row(
      children: [
        Icon(
          Icons.ac_unit_outlined,
          color: const Color.fromARGB(129, 255, 255, 255),
        ),
        Text(
          "Chance of snow",
          style: TextStyle(
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
        )
      ],
    ),
  );
}

Positioned chance_Rain() {
  return Positioned(
    top: 220,
    left: 10,
    child: Row(
      children: [
        Icon(
          Icons.ac_unit_outlined,
          color: const Color.fromARGB(129, 255, 255, 255),
        ),
        Text(
          "Chance of Rain",
          style: TextStyle(
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
        )
      ],
    ),
  );
}
