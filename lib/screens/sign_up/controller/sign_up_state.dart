part of 'sign_up_controller.dart';

abstract class SignUpState {
  const SignUpState();
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpChangeVisibilityState extends SignUpState {}
