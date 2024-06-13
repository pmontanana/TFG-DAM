import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg/main.dart';
import 'package:tfg/pantalla_medicaciones.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrearMedicacion extends StatefulWidget {
  const CrearMedicacion({super.key});

  @override
  _CrearMedicacionState createState() => _CrearMedicacionState();
}

class _CrearMedicacionState extends State<CrearMedicacion> {
  final nombreController = TextEditingController();
  final gramosController = TextEditingController();
  bool isSelected0 = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Creacion de medicacion"),
        ),
        body: Column(
          children: [
            const Text(
              "Nombre pastilla",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                hintText: '',
                contentPadding:
                    EdgeInsets.all(16.0), // Add padding around the text field
              ),
              style: TextStyle(fontSize: 18.0), // Change the font size
            ),
            const Text(
              "Gramaje",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            TextField(
              controller: gramosController,
              decoration: const InputDecoration(
                hintText: '',
                contentPadding:
                    EdgeInsets.all(16.0), // Add padding around the text field
              ),
              style: TextStyle(fontSize: 18.0), // Change the font size
            ),
            CheckboxListTile(
              title: Text("Lunes"),
              value: isSelected0,
              onChanged: (value) {
                setState(() {
                  isSelected0 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Martes"),
              value: isSelected1,
              onChanged: (value) {
                setState(() {
                  isSelected1 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Miercoles"),
              value: isSelected2,
              onChanged: (value) {
                setState(() {
                  isSelected2 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Jueves"),
              value: isSelected3,
              onChanged: (value) {
                setState(() {
                  isSelected3 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Viernes"),
              value: isSelected4,
              onChanged: (value) {
                setState(() {
                  isSelected4 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Sabado"),
              value: isSelected5,
              onChanged: (value) {
                setState(() {
                  isSelected5 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            CheckboxListTile(
              title: Text("Domingo"),
              value: isSelected6,
              onChanged: (value) {
                setState(() {
                  isSelected6 = value!; // Update the 'isSelected' variable
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collRef =
                    FirebaseFirestore.instance.collection('medicamentos');
                collRef.add({
                  'nombre': nombreController.text,
                  'gramos': gramosController.text,
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              },
              child: Text('Añadir Medicacion'),
            ),
          ],
        ));
  }
}
