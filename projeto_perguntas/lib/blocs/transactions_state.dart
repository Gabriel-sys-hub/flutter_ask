import 'package:projeto_perguntas/models/transaction.dart';

abstract class TransactionsState {
  final List<Transaction> transactions;

  TransactionsState({required this.transactions});
}

class TransactionsInitialState extends TransactionsState {
  TransactionsInitialState() : super(transactions: []);
}

class TransactionsLoadingState extends TransactionsState {
  TransactionsLoadingState() : super(transactions: []);
}

class TransactionsLoadedState extends TransactionsState {
  TransactionsLoadedState({required List<Transaction> transactions})
      : super(transactions: transactions);
}

class TransactionsErrorState extends TransactionsState {
  final Exception exception;
  TransactionsErrorState({required this.exception}) : super(transactions: []);
}
