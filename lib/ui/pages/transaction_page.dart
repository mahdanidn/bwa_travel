import 'package:bwa_travel/cubit/transaction_cubit.dart';
import 'package:bwa_travel/shared/theme.dart';
import 'package:bwa_travel/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('No Transaction'),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(state.transactions[index]);
                });
          }
        }
        return const SizedBox();
      },
    );
  }
}
