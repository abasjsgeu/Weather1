import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/ListItims_Drawrt.dart';

class Changcolor_Drawr_Controller extends GetxController {
  final ScrollController scrollController = ScrollController();
  Color? dominantColor;
  Color? vibrantColor;
  final double _lastReportedScrollOffset = 200.0;
  final double _scrollUpdateThreshold =
      296; // العتبة: قم بالتحديث كل 10 بكسلات، يمكنك تعديلها
  RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  @override
  void onInit() {
    scrollController.addListener(handleScroll);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController
        .removeListener(handleScroll); // أو handleScroll إذا كان هذا هو الاسم
    // قم بالتخلص من المتحكم دائمًا
    scrollController.dispose();

    super.onClose();
  }

  RxBool isColorLocked = false.obs;
  RxBool isColorSwitxh = false.obs;
  void handleScroll() {
    final currentOffset = scrollController.offset;
    // print(currentOffset);
    bool newIsColorLockedState = true;
    if (currentOffset > 295.33080357142856 &&
        currentOffset < 370.53080357142856) {
      print(currentOffset);
      print(isColorLocked.value);
      isColorLocked.value = newIsColorLockedState;
    }
    if (currentOffset < 280) {
      print(isColorLocked.value);
      newIsColorLockedState = true;
      isColorLocked.value = !newIsColorLockedState;
    }
    // أولاً: منطق تحديث scrollOffset.value (لتقليل إعادة بناء Obx)
    // if ((currentOffset - _lastReportedScrollOffset).abs() >=
    //         _scrollUpdateThreshold ||
    //     (currentOffset == scrollController.position.maxScrollExtent) ||
    //     (currentOffset == scrollController.position.minScrollExtent)) {
    //   scrollOffset.value = currentOffset;
    //   _lastReportedScrollOffset = currentOffset;

    //   print("Scroll Offset Updated: ${scrollOffset.value}");
    // }
  }

  RxBool sw1 = false.obs;
  RxBool sw2 = false.obs;
  RxBool sw3 = false.obs;
  RxBool sw4 = false.obs;

  bool updateSW1(bool v) {
    sw1.value = v;

    return sw1.value;
  }

  bool updateSW2(bool v) {
    sw2.value = v;

    return sw2.value;
  }

  void updateSW3(bool v) {
    sw3.value = v;
    !isColorLocked.value;
    // return sw3.value;
  }

  bool updateSW4(bool v) {
    sw4.value = v;

    return sw4.value;
  }

  void toggleSwitch(int index, bool value) {
    // print(index);
    switch (index) {
      case 1:
        sw1.value = value;
        break;
      case 2:
        sw2.value = value;
        break;
      case 3:
        !isColorSwitxh.value;
        print(isColorSwitxh.value);
        sw3.value = value;
        break;
      case 4:
        sw4.value = value;
        break;
    }
  }
}
