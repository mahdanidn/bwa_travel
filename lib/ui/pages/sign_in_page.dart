import 'package:bwa_travel/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';
import '../widget/custome_button.dart';
import '../widget/costume_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Sign In with your\nexisting account",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CostumeTextFormField(
          title: "Email Address",
          hintText: "Your full email",
          controller: _emailController,
        );
      }

      Widget passwordInput() {
        return CostumeTextFormField(
          title: "Password",
          hintText: "Your password",
          obscureText: true,
          controller: _passwordController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return CostumeButton(
              title: "Sign In",
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
              },
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            "Don't have an account? Sign Up",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          title(),
          inputSection(),
          tacButton(),
        ],
      )),
    );
  }
}
