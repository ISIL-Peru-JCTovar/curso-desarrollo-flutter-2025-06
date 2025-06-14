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

  final _miFormKey = GlobalKey<FormState>();
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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      //-- Obtener el tamaño de la foto actual elegida
      final tamanioFoto = await file.length();
      //-- Definir el tamaño maximo de la foto
      const maxTamanioFotoInBytes = 2 * 1024 * 1024; //-- 2 Mb
      //-- Validar si el tamaño es superior al permitido
      if (tamanioFoto > maxTamanioFotoInBytes) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('La imagen seleccionada no debe superar los 2 Mb'))
        );
        return;
      }
      //-- Validar las dimensiones (ancho x alto)
      final imagenEnBytes = await file.readAsBytes();
      final imagenFoto = await decodeImageFromList(imagenEnBytes);
      const minWidth = 100;
      const maxWidth = 1024;
      const minHeight = 100;
      const maxHeight = 1024;
      if ((imagenFoto.width < minWidth || imagenFoto.width > maxWidth) ||
          (imagenFoto.height < minHeight || imagenFoto.height > maxHeight)) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('La imagen seleccionada debe tener al menos entre ${minWidth}-${maxWidth} de ancho y entre ${minHeight}-${maxHeight} de alto'))
        );
        return;
      }
      //-- Seteando la foto
      setState(() {
        _foto = File(pickedFile.path);
      });
    }
  }

  void _guardarCliente() async {
    if (_miFormKey.currentState!.validate()) {
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
      _miFormKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text((widget.client == null ? 'Añadir' : 'Editar') + ' Cliente')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _miFormKey,
              child: ListView(children: [
                TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: 'Nombre y Apellidos'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe ingresar el Nombre y Apellidos';
                    } else if (value.length < 3) {
                      return 'Valor muy corto para Nombre y Apellidos, debe ser mayor a 3 caracteres';
                    } else if (value.length > 100) {
                      return 'Valor muy largo para Nombre y Apellidos, debe ser menor o igual a 100 caracteres';
                    }
                  },
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
                TextFormField(
                  controller: correoController,
                  decoration: InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe ingresar el Correo';
                    } else if (value.length < 3) {
                      return 'Valor muy corto para Correo, debe ser mayor a 3 caracteres';
                    } else if (value.length > 100) {
                      return 'Valor muy largo para Correo, debe ser menor o igual a 100 caracteres';
                    }
                  },
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
                    onPressed: _pickImage,
                    child: Text('Seleccionar Foto')
                ),
                if (_foto != null) GestureDetector(
                  onTap: _pickImage,
                  child: Image.file(_foto!, height: 100),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _guardarCliente,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Guardar Cliente',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ])),
        )
      );
  }

}
