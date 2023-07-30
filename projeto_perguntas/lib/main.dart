import 'package:flutter/material.dart';

main() {
  runApp(const AskApp());
}

class AskApp extends StatelessWidget {
  const AskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ask App'),
        
        ),
        body: const Text('Aqui vai ficar o app de perguntas')
      ),
    );
  }
}
