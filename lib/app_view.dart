import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'screens/auth/views/welcome_view.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        background: Colors.white,
        onBackground: Colors.black,
        primary: Colors.blue,
        onPrimary: Colors.white,
      )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider(
            create: (context) =>
                SignInBloc(context.read<AuthenticationBloc>().userRepository),
            child: const HomeScreen(),
          );
        } else {
          return const WelcomeScreen();
        }
      })),
    );
  }
}
