part of './controllers.dart';

class loginController extends GetxController {
  RxBool isRegister = true.obs;
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;
  RxString phone = RxString('');
  RxString email = RxString('');
  RxString password = RxString('');

  void isRegisterValue() {
    isRegister.value = !isRegister.value;
  }

  void toggleObsecure() {
    obsecureText.value = !obsecureText.value;
  }

  void setPhone(String value) {
    phone.value = value;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid number';
    }
    // Regular expression for number validation
    final numberRegex = RegExp(r'^[0-9]+$');
    if (!numberRegex.hasMatch(value)) {
      return 'Please enter a valid number';
    }
    // Validator Max 10 Character input
    if (value.length > 10) {
      return 'Number should not exceed 10 characters';
    }

    return null;
  }

  void setEmail(String value) {
    email.value = value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email';
    }
    // Regular expression for email format validation
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void setPassword(String value) {
    password.value = value;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid password';
    }
    // Validator Min 6 Character input
    if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  Future<void> login() async {
    isLoading.value = true;

    // Simulate a login process
    await Future.delayed(const Duration(seconds: 4));

    isLoading.value = false;

    Get.offAllNamed('/main');
  }
}
