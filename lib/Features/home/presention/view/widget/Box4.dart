import 'package:flutter/material.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box4 extends StatelessWidget {
  const Box4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            "Today Details",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6, // عدد العناصر الإجمالي (اختياري)
          shrinkWrap: true,
          addRepaintBoundaries: true, // قد يؤثر على الأداء

          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 140,
            mainAxisSpacing: 0,
            crossAxisSpacing: .9,
            mainAxisExtent: 130,
            childAspectRatio: .8,
          ),
          itemBuilder: (context, index) {
            return Backgrond_Box(
              height_box: null,
              Box: Center(
                child: Column(
                  spacing: 3,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.sunny,
                      size: 30,
                      color: Colors.white,
                    ),
                    Text(
                      "Humidty",
                      style: TextStyle(
                          color: const Color.fromARGB(100, 255, 255, 255),
                          fontSize: 15),
                    ),
                    Text(
                      "35%",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
