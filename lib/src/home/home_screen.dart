import 'package:cep_searcher/src/providers/cep_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  var _cepMaskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  void _requestCep() {
    String cep = _cepMaskFormatter.getMaskedText();
    BlocProvider.of<HomeBloc>(context).add(SearchCepHomeEvent(cep));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Cep'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Center(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (BuildContext context, HomeState state) {
              if (state is LoadedHomeState) {
                // vai pra tela de detalhe
              } else if (state is ErrorHomeState) {
                _showDialog("Deu ruim", "Vish");
              } else if (state is NotFoundHomeState) {
                _showDialog("Cep não encontrado", "Que pena :/");
              } else if (state is InvalidHomeState) {
                _showDialog("Se atente mais... hehehe", "Cep invalido");
              }
            },
            builder: (BuildContext context, state) {
              if (state is LoadingHomeState) {
                return CircularProgressIndicator();
              } else
                return _buildInitialState();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildTextField(),
        _buildButton(),
      ],
    );
  }

  Widget _buildTextField() {
    return new Flexible(
      child: new TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Insira o Cep",
        ),
        controller: _controller,
        inputFormatters: [_cepMaskFormatter],
      ),
    );
  }

  Widget _buildButton() {
    return RaisedButton(
      onPressed: _requestCep,
      child: const Text("Buscar endereço"),
    );
  }

  void _showDialog(String msg, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
