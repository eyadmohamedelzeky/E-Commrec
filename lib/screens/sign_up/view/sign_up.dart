import 'dart:developer';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/core/commen_cubit/commen.dart';
import 'package:ecommerce/core/widgets/custom_loading.dart';
import 'package:ecommerce/core/widgets/custom_logo_buy.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/screens/login/view/login_screen.dart';
import 'package:ecommerce/screens/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//! controllers for All
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SignUpController(),
      child: Scaffold(
          backgroundColor: kMainColor,
          body: BlocConsumer<SignUpController, SignUpState>(
            listener: (context, state) {},
            builder: (context, state) {
              final controller = BlocProvider.of<SignUpController>(context);
              return Form(
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
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this Field Required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Enter Your name',
                        filled: true,
                        textFieldColor: kTextFiledColor,
                        colorBorderSide: whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: kMainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          emailController.text = email;
                          log('Email ${emailController.text}');
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this Field Required';
                          }
                          return null;
                        },
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
                      height: height * .01.h,
                    ),
                    BlocBuilder<CommenCubit, CommonState>(
                      builder: (context, state) {
                        final controller =
                            BlocProvider.of<CommenCubit>(context);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: CustomTextFormField(
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'this Field Required';
                              } else if (password.length < 6) {
                                return 'Weak Password Please Enter Strong Password';
                              }
                              return null;
                            },
                            onChanged: (password) {
                              passwordController.text = password;
                              log('password ${passwordController.text}');
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.number,
                            obscuringCharacter: '*',
                            maxLines: 1,
                            obscureText: controller.obscureText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    state is SignUpLoadingState
                        ? const CustomLoading()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 120),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              fillColor: Colors.black,
                              textStyle: const TextStyle(fontSize: 20),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await controller.signUp(
                                    context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  Navigator.pushNamed(context, LoginScreen.id);

                                  // await Auth().signUp(
                                  //     emailController.text, passwordController.text);
                                  // Navigator.pushNamed(context, LoginScreen.id);

                                  // log('Register Successfully');
                                }
                              },
                              child: const Text(
                                'Sign Up',
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
                          'Do have an account? ',
                          style: TextStyle(color: whiteColor, fontSize: 18),
                        ),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
