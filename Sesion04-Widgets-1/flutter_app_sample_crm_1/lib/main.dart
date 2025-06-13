import 'package:flutter/material.dart';
import 'screens/client_list_screen.dart';
//import 'screens/add_client_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISIL CRM Clientes',
      theme: ThemeData(primarySwatch: Colors.teal),
      //home: AddClientScreen(),
      home: ClientListScreen(),
    );
  }

}
