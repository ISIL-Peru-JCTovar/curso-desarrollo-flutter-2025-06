import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISIL Flutter Demo 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ISIL Flutter Demo 1'),
    );
  }

}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  //Lista de elementos
  List<String> items = [];

  //Controladores de TextField: TextEditingController
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de elementos"),
      ),
      body: Column(
        children: [
          //TextField para ingresar un nuevo elemento a una lista
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Agregar nuevo elemento',
                border: OutlineInputBorder(),
              ),
            )
          ),
          //Boton que agrega elementos a una lista
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_textController.text.isNotEmpty) {
                  items.add(_textController.text);
                  _textController.clear();
                }
              });
            }, 
            child: const Text("Agregar"),
          ),
          //ListView para pintar los elementos que se vayan agregando
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            )
          ),
        ],
      )
    );
  }
}
