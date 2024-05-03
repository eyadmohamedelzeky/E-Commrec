import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpController extends Cubit<SignUpState> {
  SignUpController() : super(SignUpInitialState());
  final _auth = FirebaseAuth.instance;
  void snack({
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

  Future<void> signUp(BuildContext context,
      {required String email, required String password}) async {
    emit(SignUpLoadingState());
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('credential ${credential.user!.email}');
      log('credential ${credential.user!.uid}');
      snack(context: context, isSuccess: true, message: 'Register Sucessfully');
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      snack(context: context, isSuccess: false, message: e.code);
    } catch (e) {
      log('catch error $e');

      emit(SignUpErrorState());
    }
  }
}
