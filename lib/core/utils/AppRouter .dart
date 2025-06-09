import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wether_app_final/Features/home/presention/view/widget/Setting.dart';

abstract class AppRouter {
  static final routes = [
    GetPage(
      name: '/Setting',
      page: () {
        return Setting();
      },
    ),
  ];
}
