import 'package:get/instance_manager.dart';
import 'package:wether_app_final/Features/home/presention/manger/SunController.dart';
import 'package:wether_app_final/Features/home/presention/manger/chang_color.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SunController());
    Get.put(Changcolor_Drawr_Controller());
  }
}
