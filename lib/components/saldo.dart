import 'package:bytebankv2/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {
  SaldoCard(this.saldo);

  final Saldo saldo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<Saldo>(builder: (context, valor, child) {
          return Text(
            valor.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          );
        }),
      ),
    );
  }
}
