import 'package:flutter_app_sample_crm_1/models/client.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final _databaseName = "isil_crm_1.db";
  static final _databaseVersion = 1;

  static final table = 'clientes';

  static final columnId = '_id';
  static final columnNombre = 'nombre';
  static final columnNacionalidad = 'nacionalidad';
  static final columnCorreo = 'correo';
  static final columnCelular = 'celular';
  static final columnLinkedIn = 'linkedin';
  static final columnFacebook = 'facebook';
  static final columnFoto = 'foto';
  static final columnBoletin = 'boletin';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnNombre TEXT,
        $columnNacionalidad TEXT,
        $columnCorreo TEXT,
        $columnCelular TEXT,
        $columnLinkedIn TEXT,
        $columnFacebook TEXT,
        $columnFoto TEXT,
        $columnBoletin INTEGER
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['_id'];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Client>> getClients() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(table);
    return result.map((e) => Client.fromMap(e)).toList();
  }

  Future<void> insertOrUpdateClient(Client client) async {
    final db = await database;
    final existing = await db.query(table, where: '$columnId = ?', whereArgs: [client.id]); //SQLLite
    if (existing.isEmpty) {
      await insert(client.toMapApi());
    } else {
      await update(client.toMapApi());
    }
  }

}
