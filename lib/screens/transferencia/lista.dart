import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/menu_drawer.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'TransferĂȘncias';

class ListaTranferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciaState();
  }
}

class ListaTranferenciaState extends State<ListaTranferencias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(_tituloAppBar),
        // backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida) {
            // debugPrint('Chegou no Then do Futere');
            // debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('TransferĂȘncia Realizada!'),
                  action: SnackBarAction(
                    label: 'Info',
                    onPressed: () {},
                  ),
                ),
                );
              });
            }
          });
        },
        // backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      drawer: MenuDrawer(),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('Valor: ' + _transferencia.valor.toString()),
        subtitle: Text('Conta: ' + _transferencia.numeroConta.toString()),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
