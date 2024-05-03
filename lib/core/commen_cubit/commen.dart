import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'commen_state.dart';

class CommenCubit extends Cubit<CommonState> {
  CommenCubit() : super(CommonStatepInitialState());
  String vaildate({required String value, required String message}) {
    if (value.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  Widget suffixIcon = const Icon(Icons.visibility_off_outlined);
  bool obscureText = true;

  void changeVisibility() {
    obscureText = !obscureText;
    debugPrint('The Obscure Text Is $obscureText');
    suffixIcon = obscureText
        ? const Icon(
            Icons.visibility_off_outlined,
          )
        : const Icon(Icons.remove_red_eye_outlined);
    emit(VisiablepasswordSuccess());
  }

  bool isValidEmail(String value) {
    // Basic email validation using regex
    const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    // emit(ValidateCheckEmail());
    return RegExp(emailRegex).hasMatch(value);
  }
}
