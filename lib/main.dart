import 'package:checkout/bloc/auth_bloc/bloc.dart';
import 'package:checkout/bloc/auth_bloc/event.dart';
import 'package:checkout/bloc/signin_bloc/bloc.dart';
import 'package:checkout/repository/secure_storage.dart';
import 'package:checkout/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(SecureStorage())..add(AppStartedEvent()),
          ),
        ],
        child: const AppWrapper(),
      ),
    );
  }
}
