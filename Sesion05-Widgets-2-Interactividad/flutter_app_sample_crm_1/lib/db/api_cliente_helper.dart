import 'package:flutter_app_sample_crm_1/db/database_helper.dart';
import 'package:flutter_app_sample_crm_1/models/client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClienteHelper {

  ApiClienteHelper._privateConstructor();
  static final ApiClienteHelper instance = ApiClienteHelper._privateConstructor();

  Future<List<Client>> fetchClientsFromApi() async {
    final response = await http.get(Uri.parse('https://6854b0d96a6ef0ed662fc5b4.mockapi.io/apicrm/v1/clientes'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      List<Client> lista = jsonList.map((json) => Client.fromMapApi(json)).toList();
      return lista;
    } else {
      throw Exception('Error al obtener clientes desde la API');
    }
  }

  Future<void> syncClientsWithLocalDb() async {
    try {
      final apiClients = await fetchClientsFromApi();
      final db = DatabaseHelper.instance;
      for (var client in apiClients) {
        await db.insertOrUpdateClient(client);
      }
    } catch (e, stackTrace) {
      print('Error en la sincronización: $e');
      print('Stacktrace:\n$stackTrace');
    }
  }

  Future<void> syncLocalDbWithClients() async {
    try {
      //
    } catch (e, stackTrace) {
      print('Error en la sincronización: $e');
      print('Stacktrace:\n$stackTrace');
    }
  }

}
