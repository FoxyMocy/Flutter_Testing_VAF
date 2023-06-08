part of './pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController _loginController = Get.put(loginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    // RxBool isLogin = true.obs;

    return Scaffold(
        backgroundColor: AppColors().white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: AppColors().white,
            title: Obx(
              () => Text(
                !_loginController.isRegister.value ? "Register" : "Login",
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
                          CustomTextField(
                              isPassword: false,
                              validate: _loginController.validateEmail,
                              onchange: _loginController.setEmail,
                              hintText: "Email",
                              inputType: TextInputType.text,
                              icon: Icons.email_rounded),
                          SizedBox(
                            height: !_loginController.isRegister.value ? 12 : 0,
                          ),
                          // PHONE NUMBER INPUT
                          !_loginController.isRegister.value
                              ? CustomTextField(
                                  isPassword: false,
                                  validate: _loginController.validatePhone,
                                  onchange: _loginController.setPhone,
                                  hintText: "Phone Number",
                                  inputType: TextInputType.number,
                                  icon: Icons.phone_rounded)
                              : const SizedBox(),
                          const SizedBox(
                            height: 12,
                          ),
                          // PASSWORD INPUT
                          CustomTextField(
                            isPassword: true,
                            validate: _loginController.validatePassword,
                            onchange: _loginController.setPassword,
                            hintText: "Password",
                            inputType: TextInputType.text,
                            icon: Icons.lock_rounded,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          !_loginController.isLoading.value
                              ? TextButton(
                                  onPressed: () {
                                    final email = emailController.text;
                                    final password = passwordController.text;
                                    final fullname = phoneNumberController.text;
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      
                                      _loginController.login();
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: AppColors().lightBlue),
                                  child: Text(
                                    !_loginController.isRegister.value
                                        ? "Register"
                                        : "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors().white,
                                        fontSize: 16),
                                  ),
                                )
                              : const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                    Text("Loading...")
                                  ],
                                ),
                        ],
                      )),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_loginController.isRegister.value
                          ? "Don't have an account?"
                          : "Already have an account ?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          _loginController.isRegisterValue();
                          print(_loginController.isRegister.value);
                        },
                        child: Text(
                          _loginController.isRegister.value
                              ? "Register"
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
