import 'package:cep_searcher/src/home/home_bloc.dart';
import 'package:cep_searcher/src/home/home_screen.dart';
import 'package:cep_searcher/src/providers/cep_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dio = Dio();

    return BlocProvider(
      create: (context) => HomeBloc(CepProvider(dio)),
      child: MaterialApp(
        title: 'Buscador de endereço',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
