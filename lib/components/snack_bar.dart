import 'package:flutter/material.dart';

class MensagemSnackBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const Text('TransferĂȘncia Realizada!'),
      action: SnackBarAction(
        label: 'Info',
        onPressed: () {},
      ),
    );
  }
}
