import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_perguntas/models/transaction.dart';

main() {
  runApp(const PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesAppPage(),
    );
  }
}

class ExpensesAppPage extends StatelessWidget {
  ExpensesAppPage({Key? key}) : super(key: key);

  final _transactions = [
    Transaction(
        id: '1', title: 'Conta de luz', time: DateTime.now(), value: 1000),
    Transaction(
        id: '2', title: 'Conta de agua', time: DateTime.now(), value: 200)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'R\$ ${_transactions[index].value.toStringAsFixed(2)}',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            _transactions[index].title),
                        Text(
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          DateFormat('d MMM y')
                              .format(_transactions[index].time),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Valor em (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(child: const Text('Novo'), onPressed: () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
