import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/commen_cubit/commen.dart';
import 'package:ecommerce/core/widgets/custom_loading.dart';
import 'package:ecommerce/core/widgets/custom_logo_buy.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/forget_password/view/forget_password.dart';
import 'package:ecommerce/features/home/view/home_screen.dart';
import 'package:ecommerce/features/login/controller/login_controller.dart';
import 'package:ecommerce/features/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginController(),
      child: BlocConsumer<LoginController, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, HomeScreen.id);
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Login Failed $state'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          final loginController = BlocProvider.of<LoginController>(context);
          return Scaffold(
            backgroundColor: kMainColor,
            body: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  const CustomLogoBuy(),
                  SizedBox(
                    height: height * .1.h,
                  ),
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
                  SizedBox(
                    height: height * .02.h,
                  ),
                  BlocBuilder<CommenCubit, CommonState>(
                    builder: (context, state) {
                      final controller = BlocProvider.of<CommenCubit>(context);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CustomTextFormField(
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'please Enter Your Password';
                            }
                            return null;
                          },
                          controller: loginController.loginPasswordController,
                          keyboardType: TextInputType.number,
                          obscuringCharacter: '*',
                          maxLines: 1,
                          obscureText: controller.obscureText,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          suffixIcon: IconButton(
                              icon: controller.suffixIcon,
                              onPressed: () => controller.changeVisibility()),
                          hintText: 'Enter Your Password',
                          filled: true,
                          textFieldColor: kTextFiledColor,
                          colorBorderSide: whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kMainColor,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .05.h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetPassword.id);
                      },
                      child: const Text('Forget Password ?')),
                  state is LoginLoadingState
                      ? const CustomLoading()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            fillColor: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (loginController.isAdmin) {
                                  await loginController.validateIsAdminOrUser(
                                      loginController, context);
                                } else {
                                  loginController.signIn(context,
                                      email: loginController
                                          .loginEmailController.text,
                                      password: loginController
                                          .loginPasswordController.text);
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                            ),
                          ),
                        ),
                  SizedBox(
                    height: height * .05.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: whiteColor, fontSize: 18),
                      ),
                      TextButton(
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Text(
                            textAlign: TextAlign.center,
                            "I'm Admin",
                            style: TextStyle(
                                color: loginController.isAdmin
                                    ? kMainColor
                                    : whiteColor,
                                fontSize: 18),
                          ),
                          onPressed: () {
                            loginController.isAdminUser(true);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Text(
                            textAlign: TextAlign.center,
                            "I'm User",
                            style: TextStyle(
                                color: loginController.isAdmin
                                    ? whiteColor
                                    : kMainColor,
                                fontSize: 18),
                          ),
                          onPressed: () {
                            loginController.isAdminUser(false);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
