import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wether_app_final/core/utils/assets.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box5 extends StatelessWidget {
  const Box5({super.key});

  @override
  Widget build(BuildContext context) {
    return Backgrond_Box(
      height_box: 120,
      Box: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            wind_turbines,
            width: 100,
            height: 90,
          ),
          const Column(
            children: [
              Text(
                "was",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "was",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "was",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            width: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              line,
              fit: BoxFit.cover,
              height: 130,
              width: 10,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "was",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white30),
                ),
                Icon(
                  Icons.co_present_sharp,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  "was",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
