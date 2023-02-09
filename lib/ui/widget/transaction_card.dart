import 'package:bwa_travel/models/transaction_model.dart';
import 'package:bwa_travel/shared/theme.dart';
import 'package:bwa_travel/ui/widget/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: Destination Tile
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(
                      right: 2,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icon_star.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          // NOTE: Booking Detail Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
          ),

          // NOTE: Booking Detail Items
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveler} Person',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: transaction.selectedSeat,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueText: transaction.insurance ? 'Yes' : 'No',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueText: transaction.refunadble ? 'Yes' : 'No',
            valueColor: transaction.refunadble ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.destination.price),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
