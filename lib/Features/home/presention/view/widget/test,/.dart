import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:wether_app_final/Features/home/presention/manger/chang_color.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Custom_AppBar.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/General_INFI_Weather.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  final List<FlSpot> allSpots = const [
    FlSpot(0.5, 0.1726),
    FlSpot(1.2, 0.1025),
    FlSpot(2, 0.1025),
    FlSpot(3, 0.1025),
    FlSpot(4, 0.1025),
  ];
  final controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();

    // _loadImageColors();
  }

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  var data = [0.0, .4, 0.5, .2, 0.0, 0.0, 0.5, -1.0, -0.5, 0.0, 0.0];
  List<List<double>> dat1a = [
    [20, 22, 25, 23], // بيانات اليوم 1
    [18, 17, 19, 20], // بيانات اليوم 2
    [15, 16, 14, 13], // بيانات اليوم 3
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      fit: StackFit.expand,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/10.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            color: controller.scrollOffset.value > 50
                ? controller.backgroundColor
                : Colors.transparent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                const Custom_appBar(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                  ),
                ),
                General_INFI_Weather(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    "Hourly Forecast",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 300,
                    color: const Color.fromARGB(148, 2, 3, 0),
                    child: LineChartSample5(),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

class LineChartSample5 extends StatefulWidget {
  const LineChartSample5({
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
  State<LineChartSample5> createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<LineChartSample5> {
  List<FlSpot> get allSpots => const [
        FlSpot(1, 21),
        FlSpot(2, 24),
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

    final tooltipsOnBar = lineBarsData[0];

    return LayoutBuilder(
      builder: (context, constraints) {
        final minX = allSpots.map((s) => s.x).reduce((a, b) => a < b ? a : b);
        final maxX = allSpots.map((s) => s.x).reduce((a, b) => a > b ? a : b);
        final minY = allSpots
            .map((s) => s.y)
            .reduce((a, b) => a < b ? a + 1.5 : b - 15.6);
        final maxY = allSpots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
        final xRange = (maxX - minX) == 0 ? 1.0 : (maxX - minX);
        final yRange = (maxY - minY) == 0 ? 1.0 : (maxY - minY);

        // حساب المدى مع تفادي القسمة على الصفر
        // final xRange = (maxX - minX) == 0 ? 1.0 : (maxX + minX) + 1;
        // final yRange = (maxY - minY) == 0 ? 1.0 : (maxY + minY + 1.1);

        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: allSpots.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.9,
                        vertical: 4,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${allSpots[index].x.toInt()}:00",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.wb_sunny_outlined,
                              color: const Color.fromARGB(255, 231, 228, 219),
                              size: 27),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 132,
                  right: 3.5,
                  child: SizedBox(
                    height: 430,
                    width: (maxX - minX) * 59.4, // يتناسب مع نطاق البيانات
                    child: LineChart(
                      LineChartData(
                        extraLinesData: ExtraLinesData(
                          horizontalLines: [
                            // HorizontalLine(
                            //     strokeCap: StrokeCap.round,
                            //     // dashArray: [2, 9],
                            //     y: 1,
                            //     // label: HorizontalLineLabel(show: true,),
                            //     color: Colors.red)
                          ],
                        ),
                        lineTouchData: LineTouchData(),
                        minX: minX - 3.3,
                        maxX: maxX + .73,
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
                            final guideLines = [
                              0.0,
                              19.0,
                              34.0
                            ]; // قيم الإرشادات
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
                            color: const Color.fromARGB(242, 5, 235, 63)
                                .withOpacity(0.5),
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
                ),
                ...allSpots.map((spot) {
                  final text =
                      '${spot.y.toStringAsFixed(1)}°'; // رقم عشري واحد بدون رمز

                  final textPainter = TextPainter(
                    text: TextSpan(
                      text: text,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textDirection: TextDirection.ltr,
                  )..layout();
                  final normalizedY = (spot.y - minY) / (maxY - minY + 5);

                  final xPos =
                      ((spot.x - minX) / xRange) * (maxX + 20 - minX - 16) * 36;
                  final yPos = spot.y <= 12
                      ? (1 - normalizedY) * maxY + 58
                      : (1 - normalizedY) * maxY + 53;

                  return Positioned(
                    left: xPos + 4, // تعديل لمركزة النص
                    top: yPos + 1, // وضع النص أعلى النقطة
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
                }).toList(),
                Positioned(
                  left: 10, // قيمة موجبة بدلًا من -210
                  top: 88,
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 22, // عرض الشاشة
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: allSpots.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.5),
                              child: Icon(
                                Icons.abc_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}

// Future<PaletteGenerator> getColorsFromAssetImage(String assetPath) async {
//   final imageProvider = AssetImage(assetPath);
//   return await PaletteGenerator.fromImageProvider(
//     imageProvider,
//     maximumColorCount: 50,
//     size: Size(200, 800), // حجم الصورة المُستخدمة في التحليل
//   );
// }
