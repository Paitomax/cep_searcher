import 'package:cep_searcher/src/home/home_screen.dart';
import 'package:flutter/material.dart';

class CepApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de endereço',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}