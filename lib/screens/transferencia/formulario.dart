
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferências';
const _rotuloNumeroConta = "Número Conta";
const _rotuloDicaConta = "0000";
const _rotuloValor = "Valor";
const _rotuloDicaValor = "0.00";
const _rotuloBtn = "Transferir";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: ListView(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloNumeroConta,
                dica: _rotuloDicaConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _rotuloDicaValor,
                icone: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                // color: Colors.deepPurple,
                child: Text(_rotuloBtn),
                onPressed: () {
                  _criaTransferencia(context);
                },
              ),
            )
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('Criando Transferência');
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
