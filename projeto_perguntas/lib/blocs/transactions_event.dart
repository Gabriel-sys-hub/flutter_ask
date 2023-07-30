import '../models/transaction.dart';

abstract class TransactionsEvent {}

class GetTransactions extends TransactionsEvent {}

class PostTransactions extends TransactionsEvent {
  final Transaction transactions;

  PostTransactions({required this.transactions});
}
