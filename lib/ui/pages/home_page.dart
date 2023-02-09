// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bwa_travel/cubit/auth_cubit.dart';
import 'package:bwa_travel/cubit/destination_cubit.dart';
import 'package:bwa_travel/models/destination_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';
import '../../ui/widget/destination_card.dart';
import '../../ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,\n${state.user.name}",
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Where to fly today?",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/image_profile.png"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(
                destination,
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            Column(
              children: destinations.map((destination) {
                return DestinationTile(destination);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(state.destinations),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
