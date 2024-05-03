// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:ecommerce/screens/admin/view/admin_screen.dart';
import 'package:ecommerce/screens/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(LoginInitialState());
  final _auth = FirebaseAuth.instance;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final String adminPassword = '123456';
  void showSnackBar({
    required BuildContext context,
    required bool isSuccess,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('credential  is  ${credential.user!.email} ${Colors.green}',
          time: DateTime.now());
      showSnackBar(
          context: context, isSuccess: true, message: 'Login Sucessfully');
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        showSnackBar(context: context, isSuccess: false, message: e.code);
        emit(LoginErrorState());
      }
    }
  }
  bool isAdmin = false;
  void isAdminUser(bool admin) {
    isAdmin = admin;
    emit(ChangeAdminState());
  }
   Future<void> validateIsAdminOrUser(
      LoginController loginController, BuildContext context) async {
    if (loginController.isAdmin) {
      if (loginController.loginPasswordController.text ==
          loginController.adminPassword) {
        try {
          await loginController.signIn(context,
              email: loginController.loginEmailController.text.trim(),
              password: loginController.loginPasswordController.text.trim());
          Navigator.pushNamed(context, AdminScreen.id);
        } catch (e) {
          loginController.showSnackBar(
              context: context, isSuccess: false, message: e.toString());
        }
      } else {
        loginController.showSnackBar(
            context: context,
            isSuccess: false,
            message: 'something went wrong');
      }
    } else {
      try {
        await loginController.signIn(context,
            email: loginController.loginEmailController.text.trim(),
            password: loginController.loginPasswordController.text.trim());
        Navigator.pushNamed(context, HomeScreen.id);
      } catch (e) {
        loginController.showSnackBar(
            context: context, isSuccess: false, message: e.toString());
      }
    }
  }
}
