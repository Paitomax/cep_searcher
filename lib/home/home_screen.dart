import 'package:cep_searcher/providers/cep_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final myController = TextEditingController();

  void _requestCep() {
    if (myController.text == null || myController.text.isEmpty) {
      return;
    }
    var dio = Dio();
    CepProvider api = CepProvider(dio);
    var response = api.getCep(myController.text);
    response.then((it) {
      if (it.status == 1) {
        String msg;
        msg = "${it.state}\n${it.city}\n${it.district}\n${it.address}";
        _showDialog(msg, "Encontramos o Cep!");
      } else {
        _showDialog("Cep não encontrado.", "Ops");
      }
    }).catchError((Object obj) {});
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
            child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                child: new Flexible(
                    child: new TextField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Insira o Cep",
              ),
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(8),
                WhitelistingTextInputFormatter.digitsOnly,
                BlacklistingTextInputFormatter.singleLineFormatter,
              ],
            ))),
            new RaisedButton(
              onPressed: _requestCep,
              child: const Text("Buscar endereço"),
            )
          ],
        )),
      ),
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