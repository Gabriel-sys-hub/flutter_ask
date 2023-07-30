class Transaction {
  final String id;
  final String title;
  final DateTime time;
  final double value;

  Transaction({
    required this.id,
    required this.title,
    required this.time,
    required this.value,
  });
}
