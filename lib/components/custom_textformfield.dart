part of './components.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?)? validate;
  void Function(String)? onchange;
  String hintText;
  TextInputType inputType;
  IconData icon;

  CustomTextField(
      {
      required this.validate,
      required this.onchange,
      required this.hintText,
      required this.inputType,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final loginController _loginController = Get.put(loginController());
    return Container(
      padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10, left: 6),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors().grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors().lightBlue,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: inputType,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
              ),
              validator: validate,
              onChanged: onchange,
            ),
          ),
        ],
      ),
    );
  }
}
