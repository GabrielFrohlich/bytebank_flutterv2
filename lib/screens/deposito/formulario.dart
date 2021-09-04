import 'package:bytebankv2/components/editor.dart';
import 'package:bytebankv2/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _dicaCampoValor = "000.00";
const String _rotuloCampoValor = "Valor";
const String _textoBotaoConfirmar = "Confirmar";

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receber depósito"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (valor != null) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
