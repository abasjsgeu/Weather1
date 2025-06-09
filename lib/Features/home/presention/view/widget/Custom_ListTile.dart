// في Features/home/presention/view/widget/Custom_ListTile.dart
import 'package:flutter/material.dart';

class Custom_ListTile extends StatelessWidget {
  const Custom_ListTile({
    super.key,
    required this.texttitel,
    this.IconName,
    this.minTile_Height,
    this.onpress,
    this.customTrailing, // احتفظ بهذا فقط
  });

  final String texttitel;
  final IconData? IconName;
  final double? minTile_Height;
  final VoidCallback? onpress;
  final Widget? customTrailing; // احتفظ بهذا فقط

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      horizontalTitleGap: 10,
      minTileHeight: minTile_Height,
      title: Text(
        texttitel,
        style: const TextStyle(color: Colors.white),
      ),
      leading: Icon(
        IconName,
        color: Colors.white,
      ),
      trailing: customTrailing, // استخدم هذا فقط
    );
  }
}
