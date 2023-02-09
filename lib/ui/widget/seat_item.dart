import 'package:bwa_travel/cubit/seat_cubit.dart';

import '/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NOTE: 0.Available 1.Selected 2.Unavailable
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    background() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            "You",
            style: whiteTextStyle.copyWith(
              fontWeight: semibold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: background(),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            width: 2,
            color: borderColor(),
          ),
        ),
        child: child(),
      ),
    );
  }
}
