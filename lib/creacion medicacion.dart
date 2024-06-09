import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg/main.dart';
import 'package:tfg/pantalla_medicaciones.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrearMedicacion extends StatelessWidget {
  CrearMedicacion({super.key});

  final nombreController = TextEditingController();
  final gramosController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Creacion de medicacion"),
      ),
      body:  Column(
        children: [
          const Text("Nombre pastilla", textAlign: TextAlign.left, style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue),),
          TextField(
            controller: nombreController,
            decoration: const InputDecoration(
              hintText: 'Enter some text',
              contentPadding: EdgeInsets.all(16.0), // Add padding around the text field
            ),
            style: TextStyle(fontSize: 18.0), // Change the font size
          ),
          const Text("Gramaje", textAlign: TextAlign.left, style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue),),
          TextField(
            controller: gramosController,
            decoration: const InputDecoration(
              hintText: 'Enter some text',
              contentPadding: EdgeInsets.all(16.0), // Add padding around the text field
            ),
            style: TextStyle(fontSize: 18.0), // Change the font size
          ),
          ElevatedButton(
            onPressed: () {
              CollectionReference collRef = FirebaseFirestore.instance.collection('medicamentos');
              collRef.add({
                'nombre': nombreController.text,
                'gramos': gramosController.text,
              });

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
              // Do something with the enteredText, like displaying it or sending it to a server
            },
            child: Text('Añadir Medicacion'),
          ),

        ],
      )
    );

  }

}