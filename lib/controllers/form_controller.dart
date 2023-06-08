part of './controllers.dart';

class FormController extends GetxController {
  RxString phone = RxString('');
  RxString email = RxString('');
  RxString password = RxString('');

  void setPhone(String value) {
    phone.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void submitForm() {
    // Perform form submission logic here
    // Access the form data using the RxString variables
    print('Name: ${phone.value}');
    print('Email: ${email.value}');
    print('Password: ${password.value}');
  }
}
