import 'dart:async';

import 'package:projeto_perguntas/blocs/transactions_event.dart';
import 'package:projeto_perguntas/blocs/transactions_state.dart';
import 'package:projeto_perguntas/models/transaction.dart';

import '../repositories/transaction_repository.dart';

class TransactionsBloc {
  final _repository = TrasactionRepository();

  final StreamController<TransactionsEvent> _inputTransactionsController =
      StreamController<TransactionsEvent>();
  final StreamController<TransactionsState> _outputTransactionsController =
      StreamController<TransactionsState>();

  Sink<TransactionsEvent> get inputTransactions =>
      _inputTransactionsController.sink;
  Stream<TransactionsState> get outputTransactions =>
      _outputTransactionsController.stream;

  TransactionsBloc() {
    _inputTransactionsController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TransactionsEvent event) async {
    List<Transaction> transactions = [];

    _outputTransactionsController.add(TransactionsLoadingState());

    if (event is GetTransactions) {
      transactions = await _repository.getTransactions();
    } else if (event is PostTransactions) {
      transactions =
          await _repository.postTransactions(transaction: event.transactions);
    }

    _outputTransactionsController
        .add(TransactionsLoadedState(transactions: transactions));
  }
}
