import 'package:bwa_travel/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';
import '../widget/custome_button.dart';
import '../widget/costume_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final TextEditingController _hobbyController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Join us and get\nyour next journey",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CostumeTextFormField(
          title: "Your Name",
          hintText: "Your full name",
          controller: _nameController,
        );
      }

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

      Widget hobbyInput() {
        return CostumeTextFormField(
          title: "Hobby",
          hintText: "Your hobby",
          controller: _hobbyController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
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
              title: "Get Started",
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                      hobby: _hobbyController.text,
                    );
                // Navigator.pushNamed(context, '/bonus');
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
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            "Have an account? Sign In",
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
