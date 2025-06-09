import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/item_AIR_Qualty_Index.dart';
import 'package:wether_app_final/core/widgets/BackGrond_Box.dart';

class Box6 extends StatelessWidget {
  const Box6({super.key});

  @override
  Widget build(BuildContext context) {
    return Backgrond_Box(
      Box: Stack(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                  labelFormat: "70",
                  labelOffset: 40,
                  showLastLabel: false,
                  showFirstLabel: false,
                  canScaleToFit: true,
                  axisLineStyle:
                      AxisLineStyle(color: Colors.white30, thickness: 6),
                  axisLabelStyle: GaugeTextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                  labelsPosition: ElementsPosition.inside,
                  showLabels: true,
                  showTicks: false,
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.amberAccent,
                      value: 70,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 6,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                    )
                  ],
                )
              ])),
          const Positioned(
            top: 18,
            left: 155,
            child: Text(
              "Moderate",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
          ),
          const Positioned(
            top: 47,
            left: 97,
            child: Row(
              spacing: 16,
              children: [
                item_AIR_Qualty_Index(key: ValueKey("item_AIR_Qualty_Index1")),
                item_AIR_Qualty_Index(key: ValueKey("item_AIR_Qualty_Index2")),
                item_AIR_Qualty_Index(key: ValueKey("item_AIR_Qualty_Index3")),
                item_AIR_Qualty_Index(key: ValueKey("item_AIR_Qualty_Index4")),
                item_AIR_Qualty_Index(key: ValueKey("item_AIR_Qualty_Index5"))
              ],
            ),
          )
        ],
      ),
      height_box: 100,
    );
  }
}
