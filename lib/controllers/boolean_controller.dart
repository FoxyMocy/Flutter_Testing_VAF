part of './controllers.dart';

class booleanController extends GetxController {
  RxBool booleanValue = true.obs;

  void toggleValue() {
    booleanValue.value = !booleanValue.value;
  }
}