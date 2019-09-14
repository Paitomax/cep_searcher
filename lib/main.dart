import 'package:cep_searcher/cep_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(FlutterView());
}

class FlutterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter View',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  void _requestCep() {
    if (myController.text == null || myController.text.isEmpty) {
      return;
    }
    var dio = Dio();
    RestClient api = RestClient(dio);
    var response = api.getCep(myController.text);
    response.then((it) {
      if (it.status == 1) {
        String msg;
        msg = "${it.state}\n${it.city}\n${it.district}\n${it.address}";
        _showDialog(msg, "Encontramos o Cep!");
      }
      else {
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
        child: Center( child: new Column(
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
                        )
                    )
                ),
                new RaisedButton(onPressed: _requestCep, child: const Text("Buscar endereço"),)
              ],
            )
        ),
        ),
    );
  }

  void _showDialog(String msg, String title) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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
