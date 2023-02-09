import 'package:bwa_travel/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transactions) async {
    try {
      _transactionReference.add({
        'destination': transactions.destination.toJson(),
        'amountOfTraveler': transactions.amountOfTraveler,
        'selectedSeat': transactions.selectedSeat,
        'insurance': transactions.insurance,
        'refunadble': transactions.refunadble,
        'vat': transactions.vat,
        'price': transactions.price,
        'grandTotal': transactions.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
