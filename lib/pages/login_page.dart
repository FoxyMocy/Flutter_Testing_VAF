part of './pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController _loginController = Get.put(loginController());
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
        body: Center(
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
                  child: Obx(() => Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // EMAIL INPUT
                          CustomTextField(
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
                          Container(
                            padding: const EdgeInsets.only(
                                right: 20, top: 10, bottom: 10, left: 6),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors().grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock_rounded,
                                  color: AppColors().lightBlue,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText:
                                        _loginController.obsecureText.value,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Password',
                                    ),
                                    validator:
                                        _loginController.validatePassword,
                                    onChanged: _loginController.setPassword,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _loginController.toggleObsecure();
                                  },
                                  child: Icon(
                                    _loginController.obsecureText.value
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: AppColors().lightBlue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          !_loginController.isLoading.value
                              ? Obx(() => TextButton(
                                    onPressed: () {
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
                                  ))
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
                      )))),
              const Spacer(),
              Obx(() => Container(
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
                  ))
            ],
          ),
        ));
  }
}
