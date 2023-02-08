import 'package:get/get.dart';

class speechcontroll extends GetxController {
  RxDouble rate = 1.0.obs;

  void onclick() {
    if (rate < 2.0) {
      rate = rate + 0.5 as RxDouble;
    } else if (rate == 2.0) {
      rate = rate - 1.5 as RxDouble;
    }
  }
}
