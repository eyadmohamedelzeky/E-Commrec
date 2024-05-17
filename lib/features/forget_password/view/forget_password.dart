import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static String id = 'ForgetPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginController(),
      child: Scaffold(
        body: BlocBuilder<LoginController, LoginState>(
          builder: (BuildContext context, LoginState state) {
            final loginController = BlocProvider.of<LoginController>(context);
            return SafeArea(
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CustomTextFormField(
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'please Enter Your Email';
                            }
                            return null;
                          },
                          controller: loginController.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: 'Enter Your Email',
                          filled: true,
                          textFieldColor: kTextFiledColor,
                          colorBorderSide: whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: kMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          fillColor: Colors.black,
                          textStyle: const TextStyle(fontSize: 20),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await loginController.resetPassword(
                                  loginController.loginEmailController.text);
                            }
                          },
                          child: const Text(
                            'Send',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
