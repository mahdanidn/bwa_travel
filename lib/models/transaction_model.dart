import 'package:bwa_travel/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final String id;
  final int amountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refunadble;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTraveler = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refunadble = false,
    this.vat = 0.0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(
          json['destination']['id'], json['destination']),
      id: id,
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeat: json['selectedSeat'],
      insurance: json['insurance'],
      refunadble: json['refunadble'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeat,
        insurance,
        refunadble,
        vat,
        price,
        grandTotal,
      ];
}
