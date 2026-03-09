import 'package:bookia_store_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/cubit/auth_cubit.dart';
import '../../features/authentication/presentation/create_password_screen.dart';
import '../../features/authentication/presentation/forgot_password_screen.dart';
import '../../features/authentication/presentation/login_screen.dart';
import '../../features/authentication/presentation/otp_screen.dart';
import '../../features/authentication/presentation/password_changed_screen.dart';
import '../../features/authentication/presentation/register_screen.dart';
import '../../features/bottom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/on_boarding/presentation/welcome_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      case Routes.createPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CreatePasswordScreen(),
        );
      case Routes.passwordChangedScreen:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangedScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());


        case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
