import 'package:bwa_travel/cubit/auth_cubit.dart';
import 'package:bwa_travel/cubit/page_cubit.dart';
import 'package:bwa_travel/shared/theme.dart';
import 'package:bwa_travel/ui/widget/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/sign-in',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CostumeButton(
            title: "Sign Out",
            width: 220,
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        );
      },
    );
  }
}
