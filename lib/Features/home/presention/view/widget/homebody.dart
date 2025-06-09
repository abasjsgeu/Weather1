import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wether_app_final/Features/home/presention/manger/chang_color.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box3.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box4.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box5.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box6.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box7.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box8.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Box_1.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Custom_AppBar.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/General_INFI_Weather.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/box2.dart';

import 'package:wether_app_final/core/widgets/Custum_Text_and_Button.dart';

class Homebody extends StatelessWidget {
  Homebody({super.key});

  final Changcolor_Drawr_Controller controller = Get.find();

  // @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      fit: StackFit.expand,
      children: [
        // 1. الصورة الخلفية يمكن أن تكون Widget منفصل إذا أصبحت معقدة
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/10.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // 2. الخلفية المتكيفة - استخدام Obx للحصول على التحديثات
        const AnimatedBackgroundContainer(),
        // 3. المحتوى القابل للتمرير
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            cacheExtent: 130, // يمكن أن يساعد في الأداء لتخزين العناصر مؤقتًا
            controller: controller.scrollController,
            slivers: [
              const Custom_appBar(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
              const General_INFI_Weather(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContentBoxes(), // استدعاء الدالة المساعدة
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildContentBoxes() {
    return [
      // استخدام const حيثما أمكن لتحسين الأداء
      // تأكد أن Box1, Box2, إلخ. هي StatelessWidgets وأنها تسمح بـ const constructors.
      const Flexible(
        flex: 3,
        child: Box1(
            key: ValueKey(
                'hourly_forecast_chart_box1')), // تم تصحيح المفتاح والاسم
      ),
      const Custom_TextAndButton_inHomePage(
        text: "Daily Forecast",
        custom_icon: Icons.newspaper,
      ),
      Flexible(
        flex: 3,
        child:
            Box2(key: ValueKey('daily_forecast_chart_box2')), // تم تصحيح الاسم
      ),
      const Custom_TextAndButton_inHomePage(
        text: 'Wind(mph)',
        custom_icon: Icons.history_rounded,
      ),
      const Flexible(
        flex: 3,
        child: Box3(key: ValueKey('wind_chart_box3')),
      ),
      const Flexible(
        flex: 3,
        child: Box4(key: ValueKey('wind_info_box4')),
      ),
      const Custom_TextAndButton_inHomePage(text: "Wind / Pressure"),
      const Flexible(
        flex: 3,
        child: Box5(key: ValueKey('pressure_chart_box5')),
      ),
      const Custom_TextAndButton_inHomePage(text: "AIR QUALITY INDEX"),
      const Flexible(
        flex: 3,
        child: Box6(key: ValueKey('air_quality_box6')),
      ),
      const Custom_TextAndButton_inHomePage(text: "Allergy"),
      const Flexible(
        flex: 3,
        child: Box7(key: ValueKey('allergy_info_box7')),
      ),
      const Custom_TextAndButton_inHomePage(text: "Sun/Moon"),
      // لكل Box8 يجب أن يكون هناك مفتاح فريد لـ Flutter للتعامل معه بشكل صحيح.
      const Flexible(
        flex: 3,
        child: Box8(key: ValueKey('sun_moon_box8_1')),
      ),
    ];
  }
}
// أنشئ ملفًا جديدًا، على سبيل المثال: animated_background_container.dart

class AnimatedBackgroundContainer extends StatelessWidget {
  // final Changcolor_Drawr_Controller controller = Get.find();

  const AnimatedBackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // ضع الـ Obx هنا فقط، ولا شيء آخر يستخدم أي Rx
    return Obx(
      () {
        final Changcolor_Drawr_Controller controller = Get.find();

        return AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          color: controller.isColorLocked.value == true &&
                  controller.sw3.value == true
              ? Colors.black
              : Colors.transparent,
        );
      },
    );
  }
}
//
// Future<PaletteGenerator> getColorsFromAssetImage(String assetPath) async {
//   final imageProvider = AssetImage(assetPath);
//   return await PaletteGenerator.fromImageProvider(
//     imageProvider,
//     maximumColorCount: 50,
//     size: Size(200, 800), // حجم الصورة المُستخدمة في التحليل
//   );
// }
