import 'package:flutter/material.dart';

main() {
  runApp(const PersonalExpenses());
}

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Despesas Pessoais'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(
                child: Card(
                  color: Colors.blue,
                  child: Text('Gáfico'),
                ),
              ),
              SizedBox(
                
                child: Card(
                  color: Colors.blue,
                  child: Text('Lista de Transações'),
                ),
              ),
            ],
          )
      ),
    );
  }
}
