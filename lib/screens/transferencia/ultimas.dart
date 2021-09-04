import 'package:bytebankv2/models/transferencias.dart';
import 'package:bytebankv2/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = "Últimas transferências";

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int tamanho = 2;
            if (_quantidade < 3) {
              tamanho = _quantidade;
            }

            if (tamanho == 0) {
              return Text("Sem transferencias");
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return ItemTransferencia(_ultimasTransferencias[index]);
              },
              itemCount: tamanho,
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferenciasState();
            }));
          },
          child: Text("Transferencias"),
        ),
      ],
    );
  }
}
