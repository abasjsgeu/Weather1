import 'package:flutter/material.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/ContainerDrawer.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Custom_ListTile.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/homebody.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ContainerDrawer(
        key: ValueKey("DRAWER"),
      ),
      body: Homebody(),
    );
  }
}
