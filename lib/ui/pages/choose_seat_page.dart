// ignore_for_file: prefer_const_constructors

import 'package:bwa_travel/cubit/seat_cubit.dart';
import 'package:bwa_travel/models/destination_model.dart';
import 'package:bwa_travel/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import '../../ui/pages/checkout_page.dart';
import '../../ui/widget/custome_button.dart';
import '../../ui/widget/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE: Available
            Container(
              height: 16,
              width: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Avalilable',
              style: blackTextStyle,
            ),
            // NOTE: Selected
            Container(
              height: 16,
              width: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            // NOTE: Unavailable
            Container(
              height: 16,
              width: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                // NOTE: Seat Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // NOTE: Seat 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A1',
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: 'B1',
                      isAvailable: false,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "1",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C1',
                    ),
                    SeatItem(
                      id: 'D1',
                    ),
                  ],
                ),

                // NOTE: Seat 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "2",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C2',
                    ),
                    SeatItem(
                      id: 'D2',
                    ),
                  ],
                ),

                // NOTE: Seat 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A3',
                    ),
                    SeatItem(
                      id: 'B3',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "3",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C3',
                    ),
                    SeatItem(
                      id: 'D3',
                    ),
                  ],
                ),

                // NOTE: Seat 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A4',
                    ),
                    SeatItem(
                      id: 'B4',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "4",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C4',
                    ),
                    SeatItem(
                      id: 'D4',
                    ),
                  ],
                ),

                // NOTE: Seat 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A5',
                    ),
                    SeatItem(
                      id: 'B5',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "5",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C5',
                    ),
                    SeatItem(
                      id: 'D5',
                    ),
                  ],
                ),

                // NOTE: Your seat
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your seat",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        state.join(','),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),

                // NOTE: Total
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CostumeButton(
            title: 'Continue to Checkout',
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeat: state.join(', '),
                      insurance: true,
                      refunadble: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 30,
              bottom: 46,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
