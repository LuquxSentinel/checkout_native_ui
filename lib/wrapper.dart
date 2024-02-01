import 'package:checkout/bloc/auth_bloc/bloc.dart';
import 'package:checkout/bloc/auth_bloc/state.dart';
import 'package:checkout/bloc/signin_bloc/bloc.dart';
import 'package:checkout/pages/auth_page/signin_page.dart';
import 'package:checkout/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationUninitialized) {
        return const LoadingIndicator();
      } else if (state is AuthenticationLoading) {
        return const LoadingIndicator();
      } else if (state is AuthenticationUnauthenticated) {
        return BlocProvider(
          create: (context) =>
              SignInBloc(BlocProvider.of<AuthenticationBloc>(context)),
          child: const SignInPage(),
        );
      } else if (state is AuthenticationAuthenticated) {
        return const HomePage();
      }

      return const LoadingIndicator();
    });
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
