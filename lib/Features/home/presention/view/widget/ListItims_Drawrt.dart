import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_final/Features/home/presention/manger/chang_color.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Custom_ListTile.dart';

class ListItims_Drawrt extends StatelessWidget {
  ListItims_Drawrt({
    super.key,
  });
  final Changcolor_Drawr_Controller controller =
      Get.find<Changcolor_Drawr_Controller>();
  static const Color _activeColor = Color.fromARGB(255, 3, 218, 251);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      cacheExtent:
          1.0, // قم بتعديل هذا بناءً على ارتفاع عناصرك لضمان التحميل المسبق الكافي
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _drawerItems.length, // عدد العناصر بناءً على قائمة البيانات
      itemBuilder: (context, index) {
        final item = _drawerItems[index]; // جلب العنصر الحالي من قائمة البيانات

        // التعامل مع العنصر الأول وهو عبارة عن رأس القائمة (Header)
        if (item is DrawerHeaderItem) {
          return Container(
            height: 135,
            decoration: _lineDecoration, // تصميم خاص بالخط الفاصل
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // توسيط المحتوى عمودياً
              children: item.children, // عرض الـ Widgets المحددة في رأس القائمة
            ),
          );
        }

        // التعامل مع العناصر العادية في القائمة
        if (item is DrawerRegularItem) {
          return Custom_ListTile(
            key: ValueKey(item
                .title), // استخدم عنوان العنصر كمفتاح فريد (أو ID فريد إذا وجد)
            onpress: item.onPressed, // الدالة التي تعمل عند الضغط
            texttitel: item.title, // عنوان العنصر
            IconName: item.icon, // أيقونة العنصر
            customTrailing: _build1Trailing(item),
          );
        }

        // في حال وجود نوع غير متوقع من العناصر، عرض widget فارغ
        return const SizedBox.shrink();
      },
    );
  }

  static const BoxDecoration _lineDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(
        width: 1,
        color: Color.fromARGB(99, 255, 255, 255),
      ),
      bottom: BorderSide(
        width: 1,
        color: Color.fromARGB(99, 255, 255, 255),
      ),
    ),
  );

  bool _getSwitchValue(int index) {
    switch (index) {
      case 1:
        return controller.sw1.value;
      case 2:
        return controller.sw2.value;
      case 3:
        return controller.sw3.value;
      case 4:
        return controller.sw4.value;
      default:
        return false;
    }
  }

  late final List<DrawerItem> _drawerItems = [
    // العنصر الأول: رأس القائمة
    DrawerHeaderItem(children: [
      const Custom_ListTile(
        minTile_Height: 0,
        IconName: Icons.dashboard, // أيقونة معبرة عن "Features"
        texttitel: "Features",
      ),
      const Custom_ListTile(
        minTile_Height: 0,
        IconName:
            Icons.settings_applications, // أيقونة معبرة عن "Settings Overview"
        texttitel: "Settings Overview",
      ),
    ]),
    // العناصر العادية:
    DrawerRegularItem(
      title: "Notification Bar",
      icon: Icons.notifications_active_outlined,
      onPressed: () => controller.toggleSwitch(1, !controller.sw1.value),
      type: DrawerItemType.toggle, // هذا العنصر يحتوي على مفتاح تبديل
      switchIndex: 1, // الفهرس الخاص بمفتاح التبديل في الـ controller
    ),
    DrawerRegularItem(
      title: "Daily Weather",
      icon: Icons.wb_sunny_outlined,
      onPressed: () => controller.toggleSwitch(2, !controller.sw2.value),
      type: DrawerItemType.toggle,
      switchIndex: 2,
    ),
    DrawerRegularItem(
      title: "Weather Background",
      icon: Icons.photo_outlined,
      onPressed: () => controller.toggleSwitch(3, !controller.sw3.value),
      type: DrawerItemType.toggle,
      switchIndex: 3,
    ),
    DrawerRegularItem(
      title: "Show night info",
      icon: Icons.nights_stay_outlined,
      onPressed: () {
        controller.toggleSwitch(4, !controller.sw4.value);
      },
      type: DrawerItemType.toggle,
      switchIndex: 4,
    ),
    DrawerRegularItem(
      title: "Temperature Unit",
      icon: Icons.thermostat_outlined,
      onPressed: () {/* أضف منطق تغيير وحدة الحرارة هنا */},
      type: DrawerItemType.unit, // هذا العنصر يعرض وحدة قياس
      unitValue: '°C', // قيمة الوحدة المعروضة
    ),
    DrawerRegularItem(
      title: "Wind Unit",
      icon: Icons.wind_power_outlined,
      onPressed: () {/* أضف منطق تغيير وحدة الرياح هنا */},
      type: DrawerItemType.unit,
      unitValue: 'mpf',
    ),
    DrawerRegularItem(
      title: "Pressure Unit",
      icon: Icons.speed_outlined,
      onPressed: () {/* أضف منطق تغيير وحدة الضغط هنا */},
      type: DrawerItemType.unit,
      unitValue: 'mbar',
    ),
    DrawerRegularItem(
      title: "Visibility Unit",
      icon: Icons.visibility_outlined,
      onPressed: () {/* أضف منطق تغيير وحدة الرؤية هنا */},
      type: DrawerItemType.unit,
      unitValue: 'km',
    ),
    DrawerRegularItem(
      title: "Precipitation Unit",
      icon: Icons.water_drop_outlined,
      onPressed: () {/* أضف منطق تغيير وحدة الهطول هنا */},
      type: DrawerItemType.unit,
      unitValue: 'mm',
    ),
    DrawerRegularItem(
      title: "Remove ADS",
      icon: Icons.ad_units_outlined,
      onPressed: () {/* أضف منطق إزالة الإعلانات هنا */},
      type: DrawerItemType.ads, // هذا العنصر يعرض سعر الإعلان
      adsPrice: r'3.8$', // سعر إزالة الإعلانات
    ),
    DrawerRegularItem(
      title: "Setting",
      icon: Icons.settings,
      onPressed: () {
        Get.toNamed('/Setting');
      },
      type: DrawerItemType.normal, // عنصر عادي بدون widget خلفي خاص
    ),
  ];

////
  ///
  ///

  Widget _build1Trailing(DrawerRegularItem item) {
    switch (item.type) {
      case DrawerItemType.toggle:
        return Transform.scale(
          scale: 0.7, // تصغير حجم مفتاح التبديل
          child: Obx(
            // Obx من GetX لإعادة بناء الـ Switch فقط عند تغير قيمة الـ observable
            () => Switch(
                key: ValueKey(item.title),
                activeColor: _activeColor,
                value: _getSwitchValue(
                    item.switchIndex!), // جلب القيمة الحالية من الـ controller
                onChanged: (v) {
                  controller.isColorSwitxh.value = v;
                  controller.toggleSwitch(item.switchIndex!, v); // تحديث القيمة
                }),
          ),
        );
      case DrawerItemType.unit:
        return TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          onPressed: item.onPressed, // الدالة التي تعمل عند الضغط على زر الوحدة
          child: Column(
            mainAxisSize: MainAxisSize.min, // تصغير حجم العمود ليناسب المحتوى
            children: [
              Text(
                item.unitValue!, // عرض قيمة الوحدة (مثلاً °C)
                style: const TextStyle(color: _activeColor),
              ),
              Container(
                height: 0.8,
                width: 30,
                color: _activeColor, // خط صغير تحت الوحدة
              ),
            ],
          ),
        );
      case DrawerItemType.ads:
        return TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          onPressed:
              item.onPressed, // الدالة التي تعمل عند الضغط على سعر الإعلان
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.adsPrice!, // عرض سعر إزالة الإعلانات
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      case DrawerItemType.normal:
      case DrawerItemType
            .header: // في حال كان النوع normal أو header، لا يوجد widget خلفي
        return const SizedBox.shrink(); // Widget فارغ
    }
  }

////
  ///
  ///
}

// تعداد يحدد أنواع العناصر المختلفة في الدرج
enum DrawerItemType {
  toggle, // عنصر يحتوي على مفتاح تبديل
  unit, // عنصر يعرض وحدة قياس
  ads, // عنصر خاص بإزالة الإعلانات
  normal, // عنصر عادي
  header, // رأس القائمة
}

// فئة أساسية مختومة (sealed) للعناصر في الدرج
// لا يمكن إنشاء كائنات منها مباشرة، فقط من فئاتها الفرعية
sealed class DrawerItem {}

// فئة تمثل رأس القائمة (العنصر الأول)
class DrawerHeaderItem extends DrawerItem {
  final List<Widget> children; // قائمة بالـ Widgets التي ستظهر في الرأس
  DrawerHeaderItem({required this.children});
}

// فئة تمثل العناصر العادية في القائمة
class DrawerRegularItem extends DrawerItem {
  final String title; // عنوان العنصر
  final IconData icon; // أيقونة العنصر
  final VoidCallback onPressed; // الدالة التي تعمل عند الضغط على العنصر
  final DrawerItemType type; // نوع العنصر (toggle, unit, ads, normal)
  final int?
      switchIndex; // الفهرس الخاص بمفتاح التبديل (اختياري، فقط لـ toggle)
  final String? unitValue; // قيمة الوحدة (اختياري، فقط لـ unit)
  final String? adsPrice; // سعر الإعلان (اختياري، فقط لـ ads)

  DrawerRegularItem({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.type,
    this.switchIndex,
    this.unitValue,
    this.adsPrice,
  });
}
