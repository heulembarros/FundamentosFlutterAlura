import 'package:flutter/material.dart';

class MensagemSnackBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const Text('Transferência Realizada!'),
      action: SnackBarAction(
        label: 'Info',
        onPressed: () {},
      ),
    );
  }
}
