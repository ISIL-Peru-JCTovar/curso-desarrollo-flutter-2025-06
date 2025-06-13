import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/client.dart';
import '../db/database_helper.dart';

class AddClientScreen extends StatefulWidget {

  final Client? client; // Este será null si estamos agregando

  const AddClientScreen({Key? key, this.client}) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {

  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final celularController = TextEditingController();
  final linkedinController = TextEditingController();
  final facebookController = TextEditingController();

  String nacionalidad = 'Peruana';
  bool boletin = false;
  File? _foto;
  String? _fotoRuta;

  @override
  void initState() {
    super.initState();
    if (widget.client != null) {
      nombreController.text = widget.client!.name;
      correoController.text = widget.client!.email;
      celularController.text = widget.client!.phone;
      nacionalidad = widget.client!.nationality;
      boletin = widget.client!.wantsNotifications;
      linkedinController.text = widget.client!.linkedin ?? '';
      facebookController.text = widget.client!.facebook ?? '';
      if (widget.client!.photoPath != null && widget.client!.photoPath!.isNotEmpty) {
        _foto = File(widget.client!.photoPath!);
        _fotoRuta = widget.client!.photoPath;
      }
    }
  }


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _foto = File(picked.path);
      });
    }
  }

  void _guardarCliente() async {
    if (_formKey.currentState!.validate()) {
      final cliente = {
        'nombre': nombreController.text,
        'nacionalidad': nacionalidad,
        'correo': correoController.text,
        'celular': celularController.text,
        'linkedin': linkedinController.text,
        'facebook': facebookController.text,
        'foto': _foto?.path ?? '',
        'boletin': boletin ? 1 : 0
      };
      //-- Guardando (insertando o actualizando) el cliente
      if (widget.client == null) {
        await DatabaseHelper.instance.insert(cliente);
      } else {
        // Editar cliente existente
        final clienteActualizado = { ...cliente, '_id' : widget.client!.id };
        await DatabaseHelper.instance.update(clienteActualizado);
      }
      //await DatabaseHelper.instance.insert(cliente);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cliente guardado correctamente')));
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Añadir Cliente')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _formKey,
              child: ListView(children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: 'Nombre y Apellidos'),
                ),
                SizedBox(height: 10),
                Text('Nacionalidad'),
                RadioListTile(
                  title: Text("Peruana"),
                  value: 'Peruana',
                  groupValue: nacionalidad,
                  onChanged: (value) {
                    setState(() => nacionalidad = value!);
                  },
                ),
                RadioListTile(
                  title: Text("Extranjero"),
                  value: 'Extranjero',
                  groupValue: nacionalidad,
                  onChanged: (value) {
                    setState(() => nacionalidad = value!);
                  },
                ),
                TextField(
                  controller: correoController,
                  decoration: InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: celularController,
                  decoration: InputDecoration(labelText: 'Celular'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: linkedinController,
                  decoration: InputDecoration(labelText: 'LinkedIn'),
                ),
                TextField(
                  controller: facebookController,
                  decoration: InputDecoration(labelText: 'Facebook'),
                ),
                SizedBox(height: 10),
                SwitchListTile(
                  title: Text("¿Desea recibir boletines?"),
                  value: boletin,
                  onChanged: (value) {
                    setState(() => boletin = value);
                  },
                ),
                ElevatedButton(
                    onPressed: _pickImage, child: Text('Seleccionar Foto')),
                if (_foto != null) Image.file(_foto!, height: 100),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: _guardarCliente, child: Text('Guardar Cliente')),
              ])),
        ));
  }

}
