part of './pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booleanController _isLoginController = Get.put(booleanController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    // RxBool isLogin = true.obs;

    return Scaffold(
        backgroundColor: AppColors().white,
        appBar: AppBar(
            backgroundColor: AppColors().white,
            title: Obx(
              () => Text(
                !_isLoginController.booleanValue.value ? "Sign Up" : "Login",
                style: TextStyle(color: AppColors().black),
              ),
            )),
        body: Obx(
          () => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages().vafLogo,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // EMAIL INPUT
                          Container(
                            padding: EdgeInsets.only(
                                right: 20, top: 10, bottom: 10, left: 6),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors().grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  color: AppColors().lightBlue,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "Email",
                                      // label: Text("Email"),
                                      // border: OutlineInputBorder(),
                                    ),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      // Regular expression for email format validation
                                      final emailRegex = RegExp(
                                          r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: !_isLoginController.booleanValue.value ? 12 : 0,
                          ),
                          // PHONE NUMBER INPUT
                          !_isLoginController.booleanValue.value
                              ? Container(
                                  padding: EdgeInsets.only(
                                      right: 20, top: 10, bottom: 10, left: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors().grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone_rounded,
                                        color: AppColors().lightBlue,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: phoneNumberController,
                                          keyboardType: TextInputType.phone,

                                          decoration:
                                              const InputDecoration.collapsed(
                                            hintText: "Phone Number",
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            // Validator Max 10 Character input
                                            if (value.length > 10) {
                                              return 'Number should not exceed 10 characters';
                                            }
                                            // Regular expression for number validation
                                            final numberRegex =
                                                RegExp(r'^[0-9]+$');
                                            if (!numberRegex.hasMatch(value)) {
                                              return 'Please enter a valid number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 12,
                          ),
                          // PASSWORD INPUT
                          Container(
                            padding: EdgeInsets.only(
                                right: 20, top: 10, bottom: 10, left: 6),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors().grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock_open_rounded,
                                  color: AppColors().lightBlue,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "Password",
                                    ),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      // Validator Min 6 Character input
                                      if (value.length < 6) {
                                        return 'Password should be at least 6 characters long';
                                      }
                                      // Regular expression for number validation
                                      final numberRegex = RegExp(r'^[0-9]+$');
                                      if (!numberRegex.hasMatch(value)) {
                                        return 'Please enter a valid number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              final email = emailController.text;
                              final password = passwordController.text;
                              final fullname = phoneNumberController.text;
                              if (_formKey.currentState?.validate() ?? false) {
                                // isLogin
                                //     ?
                                //     // signInWithEmailAndPassword()
                                //     authService.signInWithEmailAndPassword(
                                //         email, password, context)
                                //     : authService.createUserWithEmailAndPassword(
                                //         email, password, fullname, context);
                              }
                            },
                            // BUTTON LOGIN
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: AppColors().lightBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                !_isLoginController.booleanValue.value
                                    ? "Sign Up"
                                    : "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors().white,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        ],
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_isLoginController.booleanValue.value
                          ? "Don't have an account?"
                          : "Already have an account ?"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          _isLoginController.toggleValue();
                          print(_isLoginController.booleanValue.value);
                        },
                        child: Text(
                          _isLoginController.booleanValue.value
                              ? "Sign Up"
                              : "Login",
                          style: TextStyle(color: AppColors().lightBlue),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


