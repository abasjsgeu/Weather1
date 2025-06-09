import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math' as math;

class SunController extends GetxController {
  late Rx<DateTime> sunrise = DateTime.now().copyWith(hour: 5).obs;
  late Rx<DateTime> sunset = DateTime.now().copyWith(hour: 18).obs;
  RxList<FlSpot> points = <FlSpot>[].obs; // Properly typed as FlSpot
  FlSpot mostLeftSpot = FlSpot(0, 0); // قيمة افتراضية

  RxDouble currentAngle = (0.0.obs); // بداية من أقصى اليسار
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();

    startTimer(); // بدء التايمر عند تهيئة الكونترولر
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(hours: 1), (_) => updateAngle());
  }

  void updateAngle() {
    final sunriseTime = sunrise.value;
    final sunsetTime = sunset.value;
    final now = DateTime.now();
    // print(now);
    // إذا كان الوقت قبل الشروق
    if (now.isBefore(sunriseTime)) {
      currentAngle.value = math.pi; // تبدأ من أقصى اليسار
      // points.assignAll(_generatePointsUpTo(math.pi)); // تعبئة كاملة قبل الشروق

      print(currentAngle.value);

      return;
    }

    // إذا كان الوقت بعد الغروب
    if (now.isAfter(sunsetTime)) {
      currentAngle.value = 0.0; // تصل إلى أقصى اليمين
      // points.assignAll(_generatePointsUpTo(0.0)); // تعبئة كاملة بعد الغروب

      print("الشمس قد غربت!");

      return;
    }

    final totalDuration = sunsetTime.difference(sunriseTime);
    final totalSeconds = totalDuration.inSeconds;

    final currentDuration = now.difference(sunriseTime);
    int currentSeconds = currentDuration.inSeconds;

    // تحديد القيمة بين 0 والوقت الكلي
    currentSeconds = currentSeconds;

    double progress = currentSeconds / totalSeconds;

    // حساب الزاوية لمسار نصف دائري من اليسار إلى اليمين
    currentAngle.value = -(math.pi - (progress * math.pi));
    // points.assignAll(
    //     _generatePointsUpTo(currentAngle.value)); // تحديث النقاط حسب الزاوية

    // print(currentAngle.value);
  }

  List<FlSpot> generateChartPoin2ts() {
    const radius = 100.0;
    const centerX = 0.0; // مركز المحور X

    points.clear(); // Clear existing points before generating new ones

    for (int i = 0; i <= 180; i++) {
      final angle = (i / 180) * math.pi;
      final x = centerX + radius * math.cos(angle);
      final y = radius * math.sin(angle);
      points.add(FlSpot(x, y));
    }
    return points.toList();
  }

  // List<FlSpot> _generatePointsUpTo(double angle) {
  //   const radius = 115.0;
  //   const totalPoints = 180;
  //   List<FlSpot> newPoints = [];

  //   for (int i = 0; i <= totalPoints; i++) {
  //     double currentPointAngle = math.pi - (i / totalPoints) * math.pi;
  //     if (currentPointAngle >= angle) {
  //       double x = radius * math.cos(currentPointAngle);
  //       double y = radius * math.sin(currentPointAngle);
  //       newPoints.add(FlSpot(x, y));
  //     }
  //   }
  //   return newPoints;
  // }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
