import '../models/transaction.dart';

class TrasactionRepository {
  final List<Transaction> _transactions = [];

  Future<List<Transaction>> getTransactions() async {
    _transactions.addAll([
      Transaction(id: '1', time: DateTime.now(), title: 'Energia', value: 1000)
    ]);

    return Future.delayed(const Duration(seconds: 2), () => _transactions);
  }

  Future<List<Transaction>> postTransactions(
      {required Transaction transaction}) async {
    _transactions.add(transaction);

    return Future.delayed(const Duration(seconds: 2), () => _transactions);
  }
}
