import 'package:bytebankv2/components/saldo.dart';
import 'package:bytebankv2/models/saldo.dart';
import 'package:bytebankv2/screens/deposito/formulario.dart';
import 'package:bytebankv2/screens/transferencia/formulario.dart';
import 'package:bytebankv2/screens/transferencia/lista.dart';
import 'package:bytebankv2/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bytebank"),
      ),
      body: ListView(
        children: [
          Align(
            child: SaldoCard(Saldo(20.0)),
            alignment: Alignment.topCenter,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) {
                        return FormularioDeposito();
                      },
                    ),
                  );
                },
                child: Text("Receber Depósito"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) {
                        return FormularioTransferencia();
                      },
                    ),
                  );
                },
                child: Text("Nova Transferência"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),
          UltimasTransferencias()
        ],
      ),
    );
  }
}
