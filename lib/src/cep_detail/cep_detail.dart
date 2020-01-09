import 'package:cep_searcher/src/models/cep_response.dart';
import 'package:flutter/material.dart';

class CepDetailScreen extends StatefulWidget {
  final CepResponse cep;

  CepDetailScreen(this.cep, {Key key}) : super(key: key);

  @override
  _CepDetailScreenState createState() {
    return _CepDetailScreenState();
  }
}

class _CepDetailScreenState extends State<CepDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.cep.code),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(this.widget.cep.state),
            Text(this.widget.cep.city),
            Text(this.widget.cep.district),
            Text(this.widget.cep.address),
          ],
        ),
      ),
    );
  }
}
