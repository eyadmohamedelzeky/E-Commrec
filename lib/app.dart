import 'package:ecommerce/core/commen_cubit/commen.dart';
import 'package:ecommerce/screens/admin/view/admin_screen.dart';
import 'package:ecommerce/screens/home/view/home_screen.dart';
import 'package:ecommerce/screens/login/view/login_screen.dart';
import 'package:ecommerce/screens/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommenCubit>(
          create: (context) => CommenCubit(),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context) => const LoginScreen(),
            SignUpScreen.id: (context) => const SignUpScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
            AdminScreen.id: (context) => const AdminScreen(),
          },
        ),
      ),
    );
  }
}
