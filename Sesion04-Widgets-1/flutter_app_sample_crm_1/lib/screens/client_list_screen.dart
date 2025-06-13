import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_sample_crm_1/db/database_helper.dart';
import 'package:flutter_app_sample_crm_1/models/client.dart';
import 'package:flutter_app_sample_crm_1/screens/add_client_screen.dart';

class ClientListScreen extends StatefulWidget {

  @override
  _ClientListScreenState createState() => _ClientListScreenState();

}

class _ClientListScreenState extends State<ClientListScreen> {

  List<Client> clients = [];

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  void _loadClients() async {
    final db = DatabaseHelper.instance;
    final data = await db.getClients();
    setState(() {
      clients = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISIL - Lista de Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refrescar',
            onPressed: _loadClients,
          ),
        ],
      ),
      body: clients.isEmpty
          ? Center(child: Text('No hay clientes guardados.'))
          : ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ListTile(
                  //leading: CircleAvatar(child: Icon(Icons.person)),
                  leading: CircleAvatar(radius: 24,
                                        backgroundImage: client.photoPath != null && client.photoPath!.isNotEmpty
                                            ? FileImage(File(client.photoPath!))
                                            : null,
                                        child: (client.photoPath == null || client.photoPath!.isEmpty)
                                            ? const Icon(Icons.person)
                                            : null,
                                      ),
                  title: Text(client.name),
                  subtitle: Text(client.email),
                  trailing: Row(mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    tooltip: 'Editar',
                                    onPressed: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddClientScreen(client: client),
                                        ),
                                      );
                                      if ((result ?? true) == true) {
                                        _loadClients(); // Vuelve a cargar si se editó
                                      }
                                    },
                                  ),
                                  /*
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    tooltip: 'Eliminar',
                                    onPressed: () {
                                      _confirmDelete(client.id!);
                                    },
                                  ),
                                  */
                                ],
                              ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Espera que se añada el cliente y luego actualiza
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddClientScreen()),
          );
          if (result == true) {
            // Llama a tu método para refrescar la lista
            _loadClients();
          }
        },
        tooltip: 'Agregar Cliente',
        child: const Icon(Icons.add),
      ),
    );
  }

}
