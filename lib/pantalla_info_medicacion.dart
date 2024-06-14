import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ePastillero/creacion_medicacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PantallaInfoMedicaciones extends StatelessWidget {
  PantallaInfoMedicaciones({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Informacion de medicacion"),
        ),
        body: Column(
          children: [
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
                          Text(medicamento['nombre']),
                          Text(' '),
                          Text(medicamento['gramos']),
                        ],
                      );
                      medicamentoWidgets.add(medicamentoWidget);
                    }
                  }

                  return Expanded(
                    child: ListView(
                      children: [medicamentoWidgets[int.parse(index)]],
                    ),
                  );
                }),
          ],
        ));
  }
}
