import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_perguntas/blocs/transactions_event.dart';
import 'package:projeto_perguntas/blocs/transactions_state.dart';

import 'blocs/transactions_bloc.dart';

main() {
  runApp(const PersonalExpensesApp());
}

class PersonalExpensesApp extends StatelessWidget {
  const PersonalExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesAppPage(),
    );
  }
}

class ExpensesAppPage extends StatefulWidget {
  const ExpensesAppPage({Key? key}) : super(key: key);

  @override
  State<ExpensesAppPage> createState() => _ExpensesAppPageState();
}

class _ExpensesAppPageState extends State<ExpensesAppPage> {
  late final TransactionsBloc _transactionsBloc;

  @override
  void initState() {
    super.initState();
    _transactionsBloc = TransactionsBloc();
    _transactionsBloc.inputTransactions.add(GetTransactions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      bottomSheet: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 200,
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
      body: StreamBuilder<TransactionsState>(
          stream: _transactionsBloc.outputTransactions,
          builder: (context, snapshot) {
            if (snapshot.data is TransactionsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (snapshot.data is TransactionsLoadedState) {
              final listTransactions = snapshot.data?.transactions ?? [];
              return Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listTransactions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'R\$ ${listTransactions[index].value.toStringAsFixed(2)}',
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                    listTransactions[index].title),
                                Text(
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  DateFormat('d MMM y')
                                      .format(listTransactions[index].time),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  
                ],
              );
            }
            return const Text('Error');
          }),
    );
  }
}
