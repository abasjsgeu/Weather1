import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box2 extends StatelessWidget {
  const Box2({
    super.key,
  });

  List<FlSpot> get allSpots2 => const [
        FlSpot(1, 31),
        FlSpot(2, 25),
        FlSpot(3, 23),
        FlSpot(4, 23),
        FlSpot(5, 24),
        FlSpot(6, 22),
        FlSpot(7, 25),
        FlSpot(8, 29),
        FlSpot(9, 31),
        FlSpot(10, 33),
      ];

  List<FlSpot> get allSpots1 => const [
        FlSpot(1, 11),
        FlSpot(2, 13),
        FlSpot(3, 14),
        FlSpot(4, 16),
        FlSpot(5, 11),
        FlSpot(6, 11),
        FlSpot(7, 10),
        FlSpot(8, 12),
        FlSpot(9, 13),
        FlSpot(10, 13),
      ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        shadow:
            Shadow(color: const Color.fromARGB(255, 255, 1, 1), blurRadius: 7),
        color: const Color.fromARGB(206, 234, 0, 0),
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 2, // حجم النقطة
            color: const Color.fromARGB(255, 221, 224, 227), // لون النقطة
            strokeWidth: 1, // سمك حدود النقطة
            strokeColor: const Color.fromARGB(61, 227, 8, 8), // لون حدود النقطة
          ),
        ),
        preventCurveOverShooting: true,
        isStepLineChart: false,
        isStrokeCapRound: false,
        spots: allSpots2,
        isCurved: true,
        barWidth: 1,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              Colors.red.withOpacity(0.4),
              const Color.fromARGB(255, 206, 213, 206).withOpacity(0.1),
            ],
            stops: [0.2, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ];

    final lineBarsData2 = [
      LineChartBarData(
        shadow: const Shadow(
            color: Color.fromARGB(156, 0, 234, 164), blurRadius: 7),
        color: const Color.fromARGB(156, 0, 234, 164),
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 2, // حجم النقطة
            color: const Color.fromARGB(255, 221, 224, 227), // لون النقطة
            strokeWidth: 1, // سمك حدود النقطة
            strokeColor: const Color.fromARGB(61, 227, 8, 8), // لون حدود النقطة
          ),
        ),
        preventCurveOverShooting: true,
        isStepLineChart: false,
        isStrokeCapRound: false,
        spots: allSpots1,
        isCurved: true,
        barWidth: 1,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(45, 0, 234, 164).withOpacity(0.3),
              const Color.fromARGB(255, 206, 213, 206).withOpacity(0.1),
            ],
            stops: const [0.2, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final minX = allSpots2.map((s) => s.x).reduce((a, b) => a < b ? a : b);
        final maxX = allSpots2.map((s) => s.x).reduce((a, b) => a > b ? a : b);
        final minY = allSpots2
            .map((s) => s.y)
            .reduce((a, b) => a < b ? a + 1.5 : b - 16.9);
        final maxY = allSpots2.map((s) => s.y).reduce((a, b) => a > b ? a : b);
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
                width: (maxX - minX) * 50.5 + 100, // تحديد عرض أساسي
                child: Stack(
                  children: [
                    ...List_Sunny_time(minY, maxY, minX, xRange, maxX, context),
                    //
                    Chart_Line(maxX, minX, maxY, yRange, lineBarsData),
                    //
                    Chart_Line1(maxX, minX, maxY, yRange, lineBarsData2),
                    //
                    ...List_Of_Icon_Down(minY, maxY, minX, xRange, maxX),

                    //

                    ...List_Of_TextBotton(minY, maxY, minX, xRange, maxX)
                  ],
                ),
              )),
        );
      },
    );
  }

  Iterable<Widget> List_Of_TextBotton(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots2.map((spot) {
      final xPos = ((spot.x - minX) / xRange) * (maxX + 21 - minX - 16) * 35;

      return Positioned(
          left: xPos + 5, // تعديل لمركزة النص
          bottom: 5, // وضع النص أعلى النقطة
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(0, 211, 160, 6),
                  shadowColor: Colors.amber,
                  minimumSize: Size(43, 500) // Add minimum size if needed
                  ),
              onPressed: () {
                print("ASS");
              },
              child: SizedBox()));
    });
  }

  Iterable<Positioned> List_Of_Icon_Down(
      double minY, double maxY, double minX, double xRange, double maxX) {
    return allSpots2.map((spot) {
      // final text = '${spot.y.toStringAsFixed(1)}°'; // رقم عشري واحد بدون رمز

      final normalizedY = (spot.y - minY) / (maxY - minY + 5);

      final xPos = ((spot.x - minX) / xRange) * (maxX + 20.4 - minX - 16) * 38;
      final yPos = spot.y <= 12
          ? (1 - normalizedY) * maxY + 58
          : (1 - normalizedY) * maxY + 53;

      return Positioned(
        left: xPos, // تعديل لمركزة النص
        bottom: 8,
        // width: 90,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  size: 15,
                  color: Colors.blueAccent,
                ),
                Text('${spot.y.toStringAsFixed(1)}°',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Icon(Icons.wb_sunny_outlined,
                color: const Color.fromARGB(255, 231, 228, 219), size: 27),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 13,
                  color: const Color.fromARGB(98, 255, 255, 255),
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
          ],
        ),
      );
    });
  }

  Positioned Chart_Line(double maxX, double minX, double maxY, double yRange,
      List<LineChartBarData> lineBarsData) {
    return Positioned(
      bottom: 160,
      right: 3.5,
      child: SizedBox(
        height: 430,
        width: (maxX - minX) * 59.6, // يتناسب مع نطاق البيانات
        child: LineChart(
          LineChartData(
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(),
            minX: minX - .3,
            maxX: maxX + .4,
            minY: -1,
            maxY: maxY + (yRange * 13.1),
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

  Positioned Chart_Line1(double maxX, double minX, double maxY, double yRange,
      List<LineChartBarData> lineBarsData2) {
    return Positioned(
      bottom: 160,
      right: 3.5,
      child: SizedBox(
        height: 430,
        width: (maxX - minX) * 59.6, // يتناسب مع نطاق البيانات
        child: LineChart(
          LineChartData(
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(),
            minX: minX - .3,
            maxX: maxX + .4,
            minY: 30, // تم التعديل هنا

            maxY: maxY + (yRange * 13.1),
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

            lineBarsData: lineBarsData2,
            // ... بقية إعدادات الرسم البياني
          ),
        ),
      ),
    );
  }

  Iterable<Widget> List_Sunny_time(double minY, double maxY, double minX,
      double xRange, double maxX, BuildContext context) {
    List<String> listOfDay = const [
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
      "Mon",
      "Wed",
      "Wed",
      "ANAS",
      "Wed",
      "ANAS",
    ];

    //     List<String> List_of_day=["Wed","Wed","Wed","Wed","Wed","Wed","Wed","Wed","Wed",];
    // String _formatTime(Int hour) {
    //   final int roundedHour;
    //   return '${roundedHour.toString().padLeft(2, '0')}:00';
    // }

    return allSpots2.map(
      (spot) {
// رقم عشري واحد بدون رمز
        // print(spot.x.toInt());
        final xPos = ((spot.x - minX) / xRange) * (maxX + 20 - minX - 16) * 38;
        return Positioned(
          left: xPos, // تعديل لمركزة النص
          bottom: 270,
          // width: 90,
          child: SizedBox(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(listOfDay[spot.x.toInt()],
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "2/11",
                  style: TextStyle(fontSize: 10, color: Colors.white54),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(Icons.wb_sunny_outlined,
                    color: const Color.fromARGB(255, 231, 228, 219), size: 27),

                //

                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 30,
                  width: 40,
                  child: Row(
                    children: [
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
                ),
                const SizedBox(
                  height: 50,
                  width: 45,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 19,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 4,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';
// // استيراد الـ Widgets الجديدة

// class Box2 extends StatelessWidget {
//   const Box2({
//     super.key,
//   });

//   // البيانات الخاصة بالخط الأول
//   static const List<FlSpot> _allSpots2 = [
//     FlSpot(1, 31),
//     FlSpot(2, 25),
//     FlSpot(3, 23),
//     FlSpot(4, 23),
//     FlSpot(5, 24),
//     FlSpot(6, 22),
//     FlSpot(7, 25),
//     FlSpot(8, 29),
//     FlSpot(9, 31),
//     FlSpot(10, 33),
//   ];

//   // البيانات الخاصة بالخط الثاني
//   static const List<FlSpot> _allSpots1 = [
//     FlSpot(1, 11),
//     FlSpot(2, 13),
//     FlSpot(3, 14),
//     FlSpot(4, 16),
//     FlSpot(5, 11),
//     FlSpot(6, 11),
//     FlSpot(7, 10),
//     FlSpot(8, 12),
//     FlSpot(9, 13),
//     FlSpot(10, 13),
//   ];

//   // قائمة الأيام (يمكن أن تكون ثابتة)
//   static const List<String> _listOfDays = [
//     "Wed",
//     "Thu",
//     "Fri",
//     "Sat",
//     "Sun",
//     "Mon",
//     "Tue",
//     "Wed",
//     "Thu",
//     "Fri",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // حساب نطاق البيانات (Min/Max)
//     final minX = _allSpots2.map((s) => s.x).reduce((a, b) => a < b ? a : b);
//     final maxX = _allSpots2.map((s) => s.x).reduce((a, b) => a > b ? a : b);
//     final minY = _allSpots2.map((s) => s.y).reduce((a, b) => a < b ? a : b);
//     final maxY = _allSpots2.map((s) => s.y).reduce((a, b) => a > b ? a : b);

//     // تجنب القسمة على صفر (إذا كان هناك نقطة واحدة فقط)
//     final xRange = (maxX - minX) == 0 ? 1.0 : (maxX - minX);

//     // القيم الثابتة لحساب مواضع الـ Widgets العلوية
//     const double positioningFactorXForTextButtons = 35.0;
//     const double positioningFactorXForOverlays = 38.0;

//     return Backgrond_Box(
//       height_box: MediaQuery.of(context).size.height * .37,
//       Box: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SizedBox(
//           width: (maxX - minX) * 50.5 + 100, // عرض يعتمد على البيانات
//           child: Stack(
//             children: [
//               // الرسم البياني الأول
//               Positioned(
//                 bottom: 160,
//                 right: 3.5,
//                 child: ChartLineWidget(
//                   spots: _allSpots2,
//                   lineColor: const Color.fromARGB(206, 234, 0, 0),
//                   shadowColor: const Color.fromARGB(255, 255, 1, 1),
//                   gradientColors: [
//                     Colors.red.withOpacity(0.4),
//                     const Color.fromARGB(255, 206, 213, 206).withOpacity(0.1),
//                   ],
//                   minYChart: minY,
//                 ),
//               ),

//               // الرسم البياني الثاني
//               Positioned(
//                 bottom: 160,
//                 right: 3.5,
//                 child: ChartLineWidget(
//                   spots: _allSpots1,
//                   lineColor: const Color.fromARGB(156, 0, 234, 164),
//                   shadowColor: const Color.fromARGB(156, 0, 234, 164),
//                   gradientColors: [
//                     const Color.fromARGB(45, 0, 234, 164).withOpacity(0.3),
//                     const Color.fromARGB(255, 206, 213, 206).withOpacity(0.1),
//                   ],
//                   minYChart:
//                       minY, // يمكنك تغيير هذا إلى 30 كما كان في الكود الأصلي إذا أردت
//                 ),
//               ),

//               // الأزرار الشفافة والنصوص والأيقونات العلوية والسفلية
//               ..._allSpots2.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final spot = entry.value;

//                 final xPosForTextButtons = ((spot.x - minX) / xRange) *
//                     ((maxX + 21 - minX - 16) *
//                         positioningFactorXForTextButtons);
//                 final xPosForOverlays = ((spot.x - minX) / xRange) *
//                     ((maxX + 20.4 - minX - 16) * positioningFactorXForOverlays);
//                 final xPosForDayDate = ((spot.x - minX) / xRange) *
//                     ((maxX + 20 - minX - 16) * positioningFactorXForOverlays);

//                 return Stack(
//                   // يمكن استخدام Stack لتجميع الأجزاء لكل نقطة
//                   children: [
//                     // أزرار الضغط الشفافة
//                     TextButtonOverlayWidget(
//                       key: ValueKey('text_button_${spot.x}'),
//                       xPosition: xPosForTextButtons,
//                       onPressed: () {
//                         // يمكنك إضافة لوج هنا بدلاً من print
//                         // debugPrint('Text button pressed for spot: ${spot.x}');
//                       },
//                     ),

//                     // الأيقونات والنصوص في الأسفل (درجة الحرارة، أيقونة الشمس، الرطوبة)
//                     SpotOverlayWidget(
//                       key: ValueKey('spot_overlay_bottom_${spot.x}'),
//                       spot: spot,
//                       xPosition: xPosForOverlays,
//                       dayText: _listOfDays[index %
//                           _listOfDays
//                               .length], // يمكنك استخدام هذا إذا أردت اليوم هنا
//                       dateText: "2/11", // قيمة ثابتة، يمكن أن تكون ديناميكية
//                       humidityPercentage:
//                           "0%", // قيمة ثابتة، يمكن أن تكون ديناميكية
//                       windPercentage:
//                           "0%", // قيمة ثابتة، يمكن أن تكون ديناميكية
//                       yMinChartValue: minY, // تمرير min/max للتحجيم
//                       yMaxChartValue: maxY,
//                     ),

//                     // مؤشرات اليوم والتاريخ والأيقونات في الأعلى
//                     DayDateOverlayWidget(
//                       key: ValueKey('day_date_overlay_${spot.x}'),
//                       xPosition: xPosForDayDate,
//                       dayText: _listOfDays[index % _listOfDays.length],
//                       dateText: "2/11", // قيمة ثابتة، يمكن أن تكون ديناميكية
//                     ),
//                   ],
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SpotOverlayWidget extends StatelessWidget {
//   final FlSpot spot;
//   final double xPosition;
//   final String dayText;
//   final String dateText;
//   final String humidityPercentage; // على سبيل المثال
//   final String windPercentage; // على سبيل المثال
//   final double yMinChartValue; // قيمة minY التي يستخدمها الرسم البياني للتحجيم
//   final double yMaxChartValue; // قيمة maxY التي يستخدمها الرسم البياني للتحجيم

//   const SpotOverlayWidget({
//     super.key,
//     required this.spot,
//     required this.xPosition,
//     required this.dayText,
//     required this.dateText,
//     required this.humidityPercentage,
//     required this.windPercentage,
//     required this.yMinChartValue,
//     required this.yMaxChartValue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // حساب الموضع Y (لـ Icons)
//     // هذا الجزء ديناميكي يعتمد على Spot.y
//     final normalizedY =
//         (spot.y - yMinChartValue) / (yMaxChartValue - yMinChartValue + 5);
//     final yPos =
//         spot.y <= 12 // هذه القيم يجب أن تكون ثابتة أو ديناميكية بناءً على معنى
//             ? (1 - normalizedY) * yMaxChartValue + 58
//             : (1 - normalizedY) * yMaxChartValue + 53;

//     return Positioned(
//       left: xPosition,
//       bottom: 8, // هذا لمحتوى "Icon Down"
//       child: Column(
//         children: [
//           // Row1: درجة الحرارة والأيقونة العلوية
//           Row(
//             children: [
//               const Icon(
//                 Icons.arrow_upward,
//                 size: 15,
//                 color: Colors.blueAccent,
//               ),
//               Text(
//                 '${spot.y.toStringAsFixed(1)}°',
//                 style: const TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           // Row2: أيقونة الشمس
//           const Icon(Icons.wb_sunny_outlined,
//               color: Color.fromARGB(255, 231, 228, 219), size: 27),
//           const SizedBox(height: 10),
//           // Row3: أيقونة الساعة والرطوبة (0%)
//           Row(
//             children: [
//               const Icon(
//                 Icons.access_time_rounded,
//                 size: 13,
//                 color: Color.fromARGB(98, 255, 255, 255),
//               ),
//               const SizedBox(width: 5),
//               Text(
//                 humidityPercentage,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Widget إضافي لأعلى المخطط (اليوم والتاريخ)
// class DayDateOverlayWidget extends StatelessWidget {
//   final double xPosition;
//   final String dayText;
//   final String dateText;

//   const DayDateOverlayWidget({
//     super.key,
//     required this.xPosition,
//     required this.dayText,
//     required this.dateText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: xPosition,
//       bottom: 270, // هذا لمحتوى "Sunny Time"
//       child: Column(
//         children: [
//           Text(dayText,
//               style: const TextStyle(color: Colors.white, fontSize: 15)),
//           const SizedBox(height: 5),
//           Text(dateText,
//               style: const TextStyle(fontSize: 10, color: Colors.white54)),
//           const SizedBox(height: 5),
//           const Icon(Icons.wb_sunny_outlined,
//               color: Color.fromARGB(255, 231, 228, 219), size: 27),
//           const SizedBox(height: 5),
//           const SizedBox(
//             height: 30,
//             width: 40,
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.access_time_rounded,
//                   size: 13,
//                   color: Color.fromARGB(98, 255, 255, 255),
//                 ),
//                 SizedBox(width: 5),
//                 Text(
//                   "0%", // ثابتة، تحتاج إلى ديناميكية
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 50,
//             width: 45,
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.arrow_upward,
//                   size: 19,
//                   color: Colors.blueAccent,
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   "0%", // ثابتة، تحتاج إلى ديناميكية
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Widget إضافي لأزرار النص الشفافة
// class TextButtonOverlayWidget extends StatelessWidget {
//   final double xPosition;
//   final VoidCallback onPressed; // لتمرير دالة عند الضغط

//   const TextButtonOverlayWidget({
//     super.key,
//     required this.xPosition,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: xPosition + 5,
//       bottom: 5,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: const Color.fromARGB(0, 211, 160, 6),
//           shadowColor: Colors.amber,
//           minimumSize: const Size(43, 500),
//         ),
//         onPressed: onPressed,
//         child: const SizedBox(),
//       ),
//     );
//   }
// }

// class ChartLineWidget extends StatelessWidget {
//   final List<FlSpot> spots;
//   final Color lineColor;
//   final Color shadowColor;
//   final List<Color> gradientColors;
//   final double minYChart;

//   const ChartLineWidget({
//     super.key,
//     required this.spots,
//     required this.lineColor,
//     required this.shadowColor,
//     required this.gradientColors,
//     required this.minYChart,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // حساب نطاق X من الـ spots الممررة
//     final minX = spots.map((s) => s.x).reduce((a, b) => a < b ? a : b);
//     final maxX = spots.map((s) => s.x).reduce((a, b) => a > b ? a : b);
//     final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);

//     // تجنب القسمة على صفر (إذا كان هناك نقطة واحدة فقط)
//     final yRange = (maxY - minYChart) == 0 ? 1.0 : (maxY - minYChart);

//     // تعريف بعض الثوابت المستخدمة داخل الرسم البياني
//     const double chartHeight = 430;
//     const double chartWidthFactor = 59.6;
//     const double minXOffset = 0.3;
//     const double maxXOffset = 0.4;
//     const double yRangeMultiplier = 13.1;

//     return SizedBox(
//       height: chartHeight,
//       width: (maxX - minX) * chartWidthFactor,
//       child: LineChart(
//         LineChartData(
//           extraLinesData: const ExtraLinesData(),
//           lineTouchData: const LineTouchData(),
//           minX: minX - minXOffset,
//           maxX: maxX + maxXOffset,
//           minY: minYChart,
//           maxY: maxY + (yRange * yRangeMultiplier),
//           borderData: FlBorderData(show: false),
//           titlesData: const FlTitlesData(show: false),
//           gridData: FlGridData(
//             show: true,
//             drawHorizontalLine: false, // تم تعطيلها في الأصل
//             checkToShowHorizontalLine: (value) {
//               const guideLines = [0.0, 19.0, 34.0];
//               return guideLines.contains(value);
//             },
//             getDrawingHorizontalLine: (value) => const FlLine(
//               color: Colors.white70,
//               strokeWidth: 1,
//               dashArray: [5, 3],
//             ),
//             checkToShowVerticalLine: (value) =>
//                 const [0.0, 0.0, 0.0].contains(value),
//             getDrawingVerticalLine: (value) => const FlLine(
//               color: Color.fromARGB(242, 5, 235, 63),
//               strokeWidth: 5,
//               dashArray: [2, 1],
//             ),
//             drawVerticalLine: false,
//           ),
//           lineBarsData: [
//             LineChartBarData(
//               shadow: Shadow(color: shadowColor, blurRadius: 7),
//               color: lineColor,
//               dotData: FlDotData(
//                 show: true,
//                 getDotPainter: (spot, percent, barData, index) =>
//                     FlDotCirclePainter(
//                   radius: 2,
//                   color: const Color.fromARGB(255, 221, 224, 227),
//                   strokeWidth: 1,
//                   strokeColor: const Color.fromARGB(61, 227, 8, 8),
//                 ),
//               ),
//               preventCurveOverShooting: true,
//               isStepLineChart: false,
//               isStrokeCapRound: false,
//               spots: spots,
//               isCurved: true,
//               barWidth: 1,
//               belowBarData: BarAreaData(
//                 show: true,
//                 gradient: LinearGradient(
//                   colors: gradientColors,
//                   stops: const [0.2, 0.8],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
