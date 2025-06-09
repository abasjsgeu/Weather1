import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

// تعريف الـ enum خارج الكلاس
enum DrawerItemType {
  toggle, // عنصر يحتوي على مفتاح تبديل
  unit, // عنصر يعرض وحدة قياس
  ads, // عنصر خاص بإزالة الإعلانات
  normal, // عنصر عادي بدون وظيفة خاصة
}

class ListeSetting extends StatelessWidget {
  const ListeSetting({
    super.key,
    required this.subtitle,
    required this.title,
    this.dottedLine,
    this.switchIndex, // هذا يفضل أن يكون bool وليس int
    this.unitValue,
    this.adsPrice,
    this.type,
    this.onPress,
    this.onToggleChanged, // دالة لمعالجة تغيير حالة التبديل
  });

  final String subtitle;
  final String title;
  final bool? dottedLine;
  final int? switchIndex; // يفضل أن يكون bool؟
  final String? unitValue;
  final String? adsPrice;
  final DrawerItemType? type;
  final VoidCallback? onPress;
  final ValueChanged<bool>? onToggleChanged; // دالة عند تغيير حالة التبديل

  // دالة لبناء الـ trailing بناءً على نوع العنصر
  Widget _build1Trailing() {
    switch (type) {
      case DrawerItemType.unit:
        return Text(
          unitValue!,
          style: const TextStyle(color: Colors.blue, fontSize: 15, height: 3),
        );
      case DrawerItemType.ads:
        return Row(
          spacing: 5,
          mainAxisSize: MainAxisSize.min, // لجعل الأيقونات متجاورة
          children: [
            // مثال لأيقونة الثيم الأول (علامة صح)
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 5, 5, 5),
            ),
            // مثال لأيقونة الثيم الثاني (دائرة زرقاء)
            CircleAvatar(
              backgroundColor: Colors.blue,
            )
          ],
        );
      case DrawerItemType.toggle:
        return Transform.scale(
          scale: 0.7, // تصغير حجم مفتاح التبديل

          child: Switch(
            value: switchIndex == 1, // تحويل int إلى bool
            onChanged: (bool newValue) {
              // استدعاء الدالة الممررة لتحديث الحالة
              if (onToggleChanged != null) {
                onToggleChanged!(newValue);
              }
              if (onPress != null) {
                // يمكنك أيضاً استدعاء onPress إذا أردت
                onPress!();
              }
            },
            activeColor: Colors.blue, // لون مفتاح التبديل
          ),
        );
      case DrawerItemType.normal:
      case null:
        return const SizedBox.shrink(); // لا شيء في الـ trailing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          minTileHeight: 1,
          minVerticalPadding: 4,
          trailing: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: _build1Trailing(),
          ),
          onTap: onPress, // اجعل الـ ListTile قابلاً للضغط باستخدام onPress
          subtitle: Text(
            subtitle,
            style:
                const TextStyle(color: Colors.white, fontSize: 15, height: 0),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.blue, fontSize: 12, height: 3),
          ),
        ),
        if (dottedLine == true)
          DottedLine(
            dashColor: const Color.fromARGB(110, 255, 255, 255),
            lineLength: MediaQuery.of(context).size.width - 32,
            dashLength: 35.0,
            dashGapLength: 2.0,
          ),
      ],
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  // نقل _drawerItems داخل الكلاس وجعله const إن أمكن لتحسين الأداء
  // ملاحظة: لكي تكون القائمة const، يجب أن تكون جميع عناصرها ثابتة (const)
  // ويجب أن تكون الـ keys فريدة لكل عنصر إذا كانت هناك عناصر بنفس النوع
  final List<ListeSetting> _drawerItems = const [
    ListeSetting(
        key: ValueKey("item1"), // مفتاح فريد
        subtitle: 'Subtitle for item 1',
        title: 'Title for item 1',
        dottedLine: true,
        type: DrawerItemType.unit,
        unitValue: "Unit 1"),
    ListeSetting(
      key: ValueKey("item2"), // مفتاح فريد
      subtitle: 'Subtitle for item 2',
      title: '',
      dottedLine: true,
      type: DrawerItemType.normal,
      adsPrice: "Price 2",
    ),
    ListeSetting(
        key: ValueKey("item4"), // مفتاح فريد
        subtitle: 'Subtitle for item 4 (Normal)',
        title: 'Title for item 4',
        dottedLine: true, // بدون خط منقط
        type: DrawerItemType.unit,
        onPress: null,
        unitValue: "Unit 1"),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: 'Theam',
        dottedLine: true,
        type: DrawerItemType.ads,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: 'Theam',
        dottedLine: true,
        unitValue: "23",
        type: DrawerItemType.unit,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: 'Theam',
        dottedLine: true,
        unitValue: "23",
        type: DrawerItemType.unit,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: '',
        dottedLine: true,
        type: DrawerItemType.toggle,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: '',
        dottedLine: true,
        type: DrawerItemType.toggle,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: '',
        dottedLine: true,
        type: DrawerItemType.toggle,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: '',
        dottedLine: true,
        type: DrawerItemType.toggle,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null),
    ListeSetting(
        key: ValueKey("item3"), // مفتاح فريد
        subtitle: 'Thea1m',
        title: '',
        dottedLine: true,
        type: DrawerItemType.toggle,
        switchIndex: 1, // مثال: 1 يعني ON
        onToggleChanged: null,
        onPress: null)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 26, 26),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          // إضافة const
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // تصحيح زر الرجوع
          },
          icon: const Icon(
            // إضافة const
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              cacheExtent: 500,
              shrinkWrap: true,
              itemCount: _drawerItems.length,
              itemBuilder: (context, index) {
                final item = _drawerItems[index];
                // بما أن _drawerItems هي List<ListeSetting>,
                // و ListeSetting هي StatelessWidget,
                // فإن item هو ويدجت بالفعل ويمكن إرجاعه مباشرة.
                return item;
              },
            ),
          ),
        ],
      ),
    );
  }
}
