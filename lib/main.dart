import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        accentColor: Colors.purple[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTranferencias(),
      debugShowCheckedModeBanner: false,
    );
  }
}
