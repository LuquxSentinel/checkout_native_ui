import 'package:checkout/bloc/signin_bloc/bloc.dart';
import 'package:checkout/bloc/signin_bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome back.\nLet's sign you in.",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  CustomForm({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            hintText: "Email",
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            controller: _passwordController,
            hintText: "Password",
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide.none,
                      )),
                  onPressed: () {
                    print('-------------------some shit----------------------');
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInButtonPressed(
                          email: _emailController.text,
                          password: _passwordController.text),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          SignInButton(
            buttonType: ButtonType.google,
            onPressed: () {},
            elevation: 0.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          SignInButton(
            buttonType: ButtonType.apple,
            onPressed: () {},
            elevation: 0.0,
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscured = false});
  final String hintText;
  final bool obscured;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.blueGrey[200],
      ),
    );
  }
}
