part of 'login_controller.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginChangeVisibilityState extends LoginState {}

class ChangeAdminState extends LoginState {}

class ForgetPasswordLoading extends LoginState {}

class ForgetPasswordScuess extends LoginState {}

class ForgetPasswordFailureState extends LoginState {}
