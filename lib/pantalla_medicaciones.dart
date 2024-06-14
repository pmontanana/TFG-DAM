import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ePastillero/creacion_medicacion.dart';
import 'package:ePastillero/pantalla_info_medicacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PantallaMedicaciones extends StatelessWidget {
  const PantallaMedicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              gradient: const LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.white70]),
              boxShadow: const [
                BoxShadow(blurRadius: 10),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Icono"),
                Text(" Nombre Medicacion "),
                Text("Gramaje"),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('medicamentos')
                  .snapshots(),
              builder: (context, snapshot) {
                List<Row> medicamentoWidgets = [];
                if (snapshot.hasData) {
                  final medicamentos = snapshot.data?.docs.reversed.toList();
                  for (var medicamento in medicamentos!) {
                    final medicamentoWidget = Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                            gradient: const LinearGradient(colors: [
                              Colors.deepPurpleAccent,
                              Colors.redAccent
                            ]),
                            boxShadow: const [
                              BoxShadow(blurRadius: 10),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PantallaInfoMedicaciones(
                                        index: medicamento['id'],
                                      )));*/
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.medication,
                                  size: 40,
                                  color: Colors.green,
                                ),
                                GradientText(
                                  medicamento['nombre'],
                                  colors: [Colors.green, Colors.yellow],
                                ),
                                GradientText(
                                  medicamento['gramos'],
                                  colors: [Colors.yellow, Colors.green],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                    medicamentoWidgets.add(medicamentoWidget);
                  }
                }

                return Expanded(
                  child: ListView(children: medicamentoWidgets),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CrearMedicacion(),
          ));
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
