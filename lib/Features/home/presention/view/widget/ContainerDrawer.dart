import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/ListItims_Drawrt.dart';

class ContainerDrawer extends StatelessWidget {
  const ContainerDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(213, 6, 45, 164),
      width: 330,
      child: Column(
        children: [
          // const SafeArea(child: Icon(Icons.web_asset)),
          ListItims_Drawrt(),
        ],
      ),
      // child: Drawer(),
    );
  }
}
